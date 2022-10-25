import pyodbc
from datetime import datetime
from configparser import ConfigParser
from bot_util import *


config = ConfigParser()
config.read("config.ini")


'''
server = config["bot_api"]["server_name"]
database = config["bot_api"]["db_name"]
username = config["bot_api"]["db_username"]
password = config["bot_api"]["db_password"]

mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
mydb.autocommit = True
mycursor = mydb.cursor()
'''


def select_docID():
    server = config["bot_api"]["server_name"]
    database = config["bot_api"]["db_name"]
    username = config["bot_api"]["db_username"]
    password = config["bot_api"]["db_password"]

    mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    mydb.autocommit = True
    mycursor = mydb.cursor()

    mycursor.execute("SELECT DocID FROM Employees")
    doc_ids = mycursor.fetchall()
    
    mycursor.close()
    mydb.close()

    return doc_ids
    
def pic_get_max():
    server = config["bot_api"]["server_name"]
    database = config["bot_api"]["db_name"]
    username = config["bot_api"]["db_username"]
    password = config["bot_api"]["db_password"]

    mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    mydb.autocommit = True
    mycursor = mydb.cursor()
    
    mycursor.execute("SELECT MAX(id) FROM Documents")
    max_id = mycursor.fetchall()

    mycursor.close()
    mydb.close()
    
    if max_id[0][0] != None:
        return max_id[0][0]
    else:
        return 0

def pic_insert(row):
    server = config["bot_api"]["server_name"]
    database = config["bot_api"]["db_name"]
    username = config["bot_api"]["db_username"]
    password = config["bot_api"]["db_password"]

    mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    mydb.autocommit = True
    mycursor = mydb.cursor()

    DocType = row[0]
    Contract_Num = row[1]
    Path2File = row[2]
    FileName = row[3]
    
    TelegramID = row[4]
    other = row[5]

    data_from_Employees = get_data_from_Employees(TelegramID)

    DocDate = datetime.now()

    EmployeesID = data_from_Employees[0]
    Region = data_from_Employees[1]
    
    sql = "INSERT INTO Documents (Path2File, FileName, DocType, Contract_Num, DocDate, EmployeesID, Region, TelegramID, other) VALUES (?,?,?,?,?,?,?,?,?)"
    values = (Path2File, FileName, DocType, Contract_Num, DocDate, EmployeesID, Region, TelegramID, other)
    mycursor.execute(sql, values)
        
    mycursor.close()
    mydb.close()

def get_data_from_Employees(TelegramID):
    server = config["bot_api"]["server_name"]
    database = config["bot_api"]["db_name"]
    username = config["bot_api"]["db_username"]
    password = config["bot_api"]["db_password"]

    mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    mydb.autocommit = True
    mycursor = mydb.cursor()
    
    mycursor.execute("SELECT id, Region, SecondName, FirstName, MiddleName FROM Employees WHERE TelegramID = "+str(TelegramID))
    id_region = mycursor.fetchall()

    mycursor.close()
    mydb.close()

    if len(id_region) == 0:
        return (None, None)
    else:
        return id_region[0]

def history(row):
    server = config["bot_api"]["server_name"]
    database = config["bot_api"]["db_name"]
    username = config["bot_api"]["db_username"]
    password = config["bot_api"]["db_password"]

    mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    mydb.autocommit = True
    mycursor = mydb.cursor()
    
    ChatID = checker(row[0])
    TelegramID = checker(row[1])
    is_bot = checker(row[2])
    username = checker(row[3])
    first_name = checker(row[4])
    last_name = checker(row[5])
    content_type = checker(row[6])
    user_message = checker(row[7])
    caption = checker(row[8])
    
    sql = "INSERT INTO Requests2Bot (ChatID, TelegramID, is_bot, username, first_name, last_name, content_type, user_message, caption) VALUES (?,?,?,?,?,?,?,?,?)"
    values = (ChatID, TelegramID, is_bot, username, first_name, last_name, content_type, user_message, caption)
    mycursor.execute(sql, values)
    
    mycursor.close()
    mydb.close()

def update_employees(DocID, TelegramID):
    server = config["bot_api"]["server_name"]
    database = config["bot_api"]["db_name"]
    username = config["bot_api"]["db_username"]
    password = config["bot_api"]["db_password"]

    mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    mydb.autocommit = True
    mycursor = mydb.cursor()
    
    sql = "UPDATE Employees SET TelegramID = " + str(TelegramID) + " WHERE DocID = " + str(DocID)

    mycursor.execute(sql)

    mycursor.close()
    mydb.close()

def select_TelegramID():
    server = config["bot_api"]["server_name"]
    database = config["bot_api"]["db_name"]
    username = config["bot_api"]["db_username"]
    password = config["bot_api"]["db_password"]

    mydb = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    mydb.autocommit = True
    mycursor = mydb.cursor()
    
    mycursor.execute("SELECT TelegramID FROM Employees")
    doc_ids = mycursor.fetchall()

    mycursor.close()
    mydb.close()

    return doc_ids
