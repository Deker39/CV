import cv2
import os
import db

cam = cv2.VideoCapture(0)
cam.set(3, 640) # set video width
cam.set(4, 480) # set video height

face_detector = cv2.CascadeClassifier('/home/pi/opencv/data/haarcascades/haarcascade_frontalface_default.xml')

# For each person, enter one numeric face id
con = db.call_db()  #вызов бв
cur = db.call_cursor(con)#вызов курсора

table_name='USER_NAME'
table_image='IMAGE'
title_name  = 'ID,NAME,AGE,MAIL,COUNTRY,LANGUAGE'
title_image = 'ID,NAME,IMAGE'

face_id = input('\n Введите ID ')
face_name = input('\n Введите  NAME ')
face_age = input('\n Введите  AGE ')
face_mail = input('\n Введите  MAIL ')
face_country = input('\n Введите  COUNTRY ')
face_language = input('\n Введите  LANGUAGE ')

values_name = (face_id,face_name,face_age,face_mail,face_country,face_language)
db.insert_db(cur,con,table_name,title_name,values_name)# загрузка данных о пользователе а бд

print("\n [INFO] Initializing face capture. Look the camera and wait ...")
# Initialize individual sampling face count
count = 0

while(True):
    ret, img = cam.read()
    img = cv2.flip(img, -1) # flip video image vertically
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = face_detector.detectMultiScale(gray, 1.3, 5)

    for (x,y,w,h) in faces:
        cv2.rectangle(img, (x,y), (x+w,y+h), (255,0,0), 2)     
        count += 1

        # Save the captured image into the datasets folder
        #cv2.imwrite("dataset/User." + str(face_id) + '.' + str(count) + ".jpg", gray[y:y+h,x:x+w])
        values_image = (face_id,face_name,cv2.imwrite( str(face_id) + '.' + str(count) + ".jpg",gray[y:y+h,x:x+w]))
        db.insert_db(cur,con,table_image,values_image)

        cv2.imshow('image', img)

    k = cv2.waitKey(100) & 0xff # Press 'ESC' for exiting video
    if k == 27:
        break
    elif count >= 40: # Take 30 face sample and stop video
         break

# Do a bit of cleanup
print("\n [INFO] Exiting Program and cleanup stuff")
cam.release()
cv2.destroyAllWindows()
