import db

#table_name='USER_NAME'

title  = 'ID,NAME,AGE,MAIL,COUNTRY,LANGUAGE'

con = db.call_db()  #вызов бв
cur = db.call_cursor(con)#вызов курсора


#rows = db.select_db(cur,table_name,values)#выборка таблицы

#for row in rows:
#    print(row [:][1])

#values = (7, 'Marina', 21, 'shluha@gmial.com', 'Russian','ukrain')

#db.insert_db(cur,con,table_name,title,values)
values = ('''ID INT PRIMARY KEY NOT NULL,
            NAME TEXT NOT NULL,
            IMAGE OID''')

db.creat_table_db(cur,con,'IMAGE',values)


