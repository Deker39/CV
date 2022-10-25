import json
import telebot
import time
from configparser import ConfigParser
from bot_sql import *
from bot_file_processing import *
import os
from PIL import Image
from fpdf import FPDF
from bot_util import *
from datetime import datetime 

    
config = ConfigParser()
config.read("config.ini")


# Создаем экземпляр бота
bot = telebot.TeleBot(config["bot_api"]["token"])
#telebot.apihelper.SESSION_TIME_TO_LIVE = 5 * 60

# Проверка maxID в базе. За пределами функции чтобы не задваивало
i = pic_get_max()

list_of_nigers = select_docID()
list_of_tele = []

@bot.message_handler(commands=['356'])
def start_auth(message):
    global_info(message)
    print("command")

    global list_of_tele
    list_of_tele.append(message.from_user.id)

    bot.send_message(message.chat.id, 'Супер. Ты угадал(а) пароль. Теперь введи номер своего удостоверения')

@bot.message_handler(content_types=['text'])
def auth(message):
    global list_of_tele
    for tele in list_of_tele:
        if tele == message.from_user.id:
            global_info(message)
            print('text')
            if message.text.isdigit():
                global list_of_nigers
                for niger in list_of_nigers:
                    if message.text == str(niger[0]):
                        update_employees(niger[0], tele)
                        niger_data = get_data_from_Employees(tele)
                        bot.send_message(message.chat.id, 'Привет, ' +
                                         str(niger_data[2]) + " " + str(niger_data[3]) + " " + str(niger_data[4]) +
                                         '. Теперь можешь скидывать фото актов')
                        break
            else:
                bot.reply_to(message, "Принимаются только цифры")

#@bot.message_handler(content_types=['photo', 'document'])
@bot.message_handler(content_types=['photo'])
def main_work(message):
    list_of_ok = select_TelegramID()
    for ok in list_of_ok:
        if ok[0] == None:
            continue
        elif ok[0] == message.from_user.id:
            global i
            if message.content_type == 'photo':
                try:
                    print('*'*50)
                    row = global_info(message)
                    print(datetime.now().strftime("%d.%m.%y %H:%M:%S"), row)
                    photo_info = bot.get_file(message.photo[len(message.photo) - 1].file_id)
                    downloaded_file = bot.download_file(photo_info.file_path)
                    i += 1                    
                    file_result = picture_saving(downloaded_file, i, row[-1])
                    db_row = (file_result[0], file_result[1], file_result[2], file_result[3],
                              row[1], null_checker(row[4]) + " " + null_checker(row[5]) +
                              ", " + null_checker(row[3]))
                    pic_insert(db_row)
                    history(row)
                    print(datetime.now().strftime("%d.%m.%y %H:%M:%S"), db_row)
                    bot.reply_to(message, "Пожалуй, я сохраню этот акт:\n\n" + str(file_result[3]))
                except Exception as exc:
                    print('ERROR', datetime.now().strftime("%d.%m.%y %H:%M:%S"), exc)
                    #bot.reply_to(message, exc)

'''
            elif message.content_type == 'document':
                try:
                    row = global_info(message)
                    #print("document")
                    file_info = bot.get_file(message.document.file_id)
                    downloaded_file = bot.download_file(file_info.file_path)
                    i += 1
                    file_result = picture_saving(downloaded_file, i)
                    db_row = (file_result[0], file_result[1], file_result[2], file_result[3],
                              row[1], null_checker(row[4]) + " " + null_checker(row[5]) +
                              ", " + null_checker(row[3]))
                    pic_insert(db_row)
                    history(row)
                    bot.reply_to(message, "Пожалуй, я сохраню этот файл:\n\n" + str(file_result[3]))
                except Exception as e:
                    # превести в логи
                    bot.reply_to(message, e)
'''
# Запускаем бота
bot.infinity_polling(timeout=10, long_polling_timeout = 5)
#bot.polling(none_stop=True, interval=0)
