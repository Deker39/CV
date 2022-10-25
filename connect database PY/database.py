import mysql.connector
from mysql.connector import Error

class db(object):

    def connection(self):
        connection = None
        try:
            connection = mysql.connector.connect(
                host="localhost",
                user="root",
                passwd="qweasdzxc@11",
                database="mydatabase"
            )
            print("Connection to MySQL DB successful")
            return connection
        except Error as e:
            print(f"The error '{e}' occurred")


    def insert(self,name_table,columns_table,variables):
        mydb = self.connection()
        mycursor = mydb.cursor()
        sql = "INSERT INTO {0} ({1}) VALUES {2}".format(name_table,columns_table,variables)
        mycursor.execute(sql)
        mydb.commit()

        print(mycursor.rowcount, "record inserted.")

    def select(self,name_table):
        mydb = self.connection()
        mycursor = mydb.cursor()
        mycursor.execute("SELECT * FROM {0}".format(name_table))
        myresult = mycursor.fetchall()

        print (myresult)

    def select_where(self,name_table,column,value):
        mydb = self.connection()
        mycursor = mydb.cursor()
        mycursor.execute("SELECT * FROM {0} WHERE {1} = '{2}'".format(name_table,column,value))
        myresult = mycursor.fetchall()

        print(myresult)
        return  myresult

    def delete(self,name_table,columns_table,variables):
        mydb = self.connection()
        mycursor = mydb.cursor()
        sql ="DELETE FROM {0} WHERE {1} = '{2}'".format(name_table,columns_table,variables)
        mycursor.execute(sql)
        mydb.commit()
        print (mycursor.rowcount, "record(s) deleted")

    def update(self,name_table,columns_table,first_variable,second_variable):
        mydb = self.connection()
        mycursor = mydb.cursor()
        sql = "UPDATE {0} SET {1} = '{3}' WHERE {1} = '{2}'".format(name_table,columns_table,
                                                                first_variable,second_variable)
        mycursor.execute(sql)
        mydb.commit()
        print (mycursor.rowcount, "record(s) affected")


# c1.insert(name_table,columns_table,variables)
# for x in c1.select(name_table):
#     print(x)

# c1.delete(name_table,columns_table,variables)

# c1.update(name_table,columns_table,variables1,variables2)
# for x in c1.select(name_table):
#     print(x)

# name_table = ("nbu")
# column = 'cc'
# value = 'USD'
#
# c1 = db()
# j = c1.select_where(name_table,column,value)
# print(j[0][3])
# # for x in j:
# #     print(x)
# #     print(x[3])