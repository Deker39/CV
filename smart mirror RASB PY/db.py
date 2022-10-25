import psycopg2

#table_name='USER_NAME'
#values = (7, 'Marina', 21, 'examle@gmial.com', 'Ukraine','ukrain')
#title  = 'ID,NAME,AGE,MAIL,COUNTRY,LANGUAGE'
#Vakues for creat_table
#values = ('''ID INT PRIMARY KEY NOT NULL,
#        NAME TEXT NOT NULL,
#        AGE INT NOT NULL,
#        MAIL CHAR(50),
#       COUNTRY CHAR(50),
#        LANGUAGE CHAR(50)''')

def call_db():
    con = psycopg2.connect (
        database="leyla",
        user="postgres",
        password="1111",
        host="192.168.1.6",
        port="5432"
    )
    return con

def call_cursor(con):
    cur = con.cursor ( )
    return cur

def creat_table_db(cur,con,table_name,values):
    cur.execute ( '''CREATE TABLE %s
         (%s);''' % (table_name, values) )
    con.commit ( )
    con.close ( )
    print ( "Table created successfully" )

def select_db(cur,table_name,values):
    cur.execute ( "SELECT %s from %s" %(values,table_name,))
    rows = cur.fetchall ( )
    return rows

def insert_db(cur,con,table_name,title,values):
    cur.execute (
        "INSERT INTO %s (%s) VALUES %s" %(table_name,title,values,))
    con.commit()
    con.close ( )
    print("Record inserted successfully into table")


def delete_db(cur,con,table_name,pk,number_pk):
    cur.execute ( "DELETE from %s where %s=%s" %(table_name,pk,number_pk,) )
    con.commit ( )
    con.close ( )
    print ( "Record deleted successfully" )

def update_db(cur,con,table_name,values,number_values,pk,number_pk):
    cur.execute ( "UPDATE %s set %s = %s where %s =%s" %(table_name,values,number_values,pk,number_pk,) )
    con.commit ( )
    con.close ( )
    print ( "Record updated successfully" )




