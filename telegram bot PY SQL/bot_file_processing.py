import cv2
import time
import pytesseract
from PIL import Image
from fpdf import FPDF
from configparser import ConfigParser
from bot_util import *


config = ConfigParser()
config.read("config.ini")


pytesseract.pytesseract.tesseract_cmd = config["bot_api"]["path2tesseract"]


def granitsi_otrezka(a, b, c):
    #print(a, b, c)
    if 0 < a < b:
        #print('[]')
        return a, b
    elif 0 == a < b:
        #print('-]')
        return b-5, b
    elif 0 == b < a:
        #print('[-')
        return a, a+5
    else:
        #print('--')
        return 0, c
        
def pic_recognize(pic, ind):
    img = cv2.imread(pic)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    preprocess = "thresh"

    config = r'--oem 3 --psm 1 '

    if preprocess == "thresh":
        gray = cv2.threshold(gray, 0, 255,
                             cv2.THRESH_BINARY | cv2.THRESH_OTSU)[1]
    elif preprocess == "blur":
        gray = cv2.medianBlur(gray, 3)
        
    data = pytesseract.image_to_string(gray, config=config, lang='ukr+eng')
    lst = data.split()
    
    dogovor = 0
    vid = 0
    for i in range(len(lst)):
        if 'договор' in lst[i]:
            dogovor = i
        if lst[i] == 'від':
            vid = i
    a, b = granitsi_otrezka(dogovor, vid, len(lst))
    
    result = []
    for i in range(len(lst)):
        if 'встановлення' in lst[i]:
            result.append('встановлення'.upper())
        if 'зняття' in lst[i]:
            result.append('зняття'.upper())
        if 'заміни' in lst[i] or 'заміна' in lst[i]:
            result.append('заміни'.upper())
           
    for val in lst[a:b]:
        for word in val:
            for i in range(10):
                if word == str(i):
                    result.append(val.replace('/', '_', val.count('/')).replace(',', '', val.count(',')).replace('.', '', val.count('.')))
                    break
    logger_tess((lst, lst[a:b], sorted(set(result))), ind)
    
    return sorted(set(result))

def pdf_saving(tmp_src, tmp_file_name, c_num, w_type):
    #saving LA picture to main folder in PDF format
    main_path = config['bot_api']['main_path']
    if w_type == 'ЗАМІНИ':
        main_file_name = w_type + ' кліше ' + c_num + ' ' + tmp_file_name[:-4] + '.pdf'
    else:
        main_file_name = w_type + ' договір ' + c_num + ' ' + tmp_file_name[:-4] + '.pdf'
    main_src = main_path + main_file_name
    
    pdf = FPDF()
    pdf.add_page()
    pdf.image(tmp_src, x=10, y=8, w=190)
    pdf.output(main_src)
    
    return main_path, main_file_name

    
def picture_saving(binary_file, i, caption):
    #making filename and path for saving
    tmp_file_name = time.strftime("%d.%m.%Y_") + '{:04}'.format(i) + '.png'
    tmp_path = config["bot_api"]["tmp_path"]
    tmp_src = tmp_path + tmp_file_name

    #saving original file in tmp directory
    with open(tmp_src, 'wb') as new_file:
        new_file.write(binary_file)

    #overwritting tmp file to LA
    img = Image.open(tmp_src).convert('LA')
    img.save(tmp_src)

    #get data from LA picture
    data_from_file = pic_recognize(tmp_src, i)

    if len(data_from_file) == 2:
        c_num = data_from_file[0]   #contract number
        w_type = data_from_file[1]  #working type (type of act)
        main_path, main_file_name = pdf_saving(tmp_src, tmp_file_name, c_num, w_type)
        return w_type, c_num, main_path, main_file_name
    elif len(data_from_file) == 1:
        if data_from_file[0] in ['ВСТАНОВЛЕННЯ', 'ЗНЯТТЯ', 'ЗАМІНИ']:
            w_type = data_from_file[0]
            if w_type == 'ЗАМІНИ':
                c_num = null_checker(caption)
            else:
                c_num = 'UNIDENTIFIED'
            main_path, main_file_name = pdf_saving(tmp_src, tmp_file_name, c_num, w_type)
            return w_type, c_num, main_path, main_file_name
        else:
            w_type = 'UNIDENTIFIED'
            c_num = data_from_file[0]
            main_path, main_file_name = pdf_saving(tmp_src, tmp_file_name, c_num, w_type)
            return w_type, c_num, main_path, main_file_name
    else:
        w_type = 'UNIDENTIFIED'
        c_num = 'UNIDENTIFIED'
        main_path, main_file_name = pdf_saving(tmp_src, tmp_file_name, c_num, w_type)
        return w_type, c_num, main_path, main_file_name       

