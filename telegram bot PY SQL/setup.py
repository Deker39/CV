import os
import shutil
import socket
import sys
from configparser import ConfigParser


def create_path(default_path, default_data_path):
    if os.path.exists(default_path) == False:
        os.mkdir(default_path)
        os.mkdir(default_data_path)
    print("1. Paths created")

def copy(default_path):      
    files_list = ["bot_main.py", "bot_sql.py", "bot_tesseract.py",
                  "config.ini", "sql.txt", "requirements.txt"]
    for file in files_list:
        shutil.copyfile(file, default_path + file)
    shutil.unpack_archive("Tesseract-OCR.zip", default_path)
    print("2. Files copied")

def libs_install():
    os.system("pip install -r requirements.txt")
    print("3. Additional libraries installed")
        
def config_maker(default_path, default_data_path):      
    config = ConfigParser()
    config.read(default_path + "config.ini")  

    for folder in os.listdir("C:\\Program Files\\Microsoft SQL Server\\"):
        if "MSSQL" in folder:
            server_name = folder[folder.find(".")+1:]
            break
        
    config.set('bot_api', 'path', default_data_path)
    config.set('bot_api', 'server_name', socket.gethostname() + "\\" + server_name)
    config.set('bot_api', 'path2tesseract', default_path + "Tesseract-OCR\\tesseract.exe")
    with open(default_path + 'config.ini', 'w') as configfile:
        config.write(configfile)
    print("4. Config file updated")

def make_db(default_path):
    cursor.execute("CREATE DATABASE luchesko")

    cursor.close()
    mydb.close()

    print("5. Database created")

def make_tables(default_path):
    cursor.execute("""
                    USE luchesko
                    CREATE TABLE Documents(
                            [id] INT IDENTITY PRIMARY KEY,
                            [Path2File] [nvarchar](50) NOT NULL,
                            [FileName] [nvarchar](25) NOT NULL,
                            [DocType] [nvarchar](15) NULL,
                            [DocDate] [date] NULL,
                            [EmployeesID] [smallint] NULL,
                            [Region] [nvarchar](30) NULL,
                            [TelegramID] [bigint] NULL,
                            [other] [nvarchar](max) NULL,
                            [AddedAt] DATETIME2(0) NOT NULL DEFAULT GETDATE()
                    )

                    USE luchesko
                    CREATE TABLE Employees(
                            [id] INT IDENTITY PRIMARY KEY,
                            [SecondName] [nvarchar](30) NOT NULL,
                            [FirstName] [nvarchar](15) NOT NULL,
                            [MiddleName] [nvarchar](15) NULL,
                            [Position] [nvarchar](35) NOT NULL,
                            [DocID] [smallint] NOT NULL,
                            [Region] [nvarchar](30) NOT NULL,
                            [TelegramID] [bigint] NULL,
                            [CreatedAt] DATETIME2(0) NOT NULL DEFAULT GETDATE()
                    )

                    USE luchesko
                    CREATE TABLE Requests2Bot(
                            [id] INT IDENTITY PRIMARY KEY,
                            [ChatID] [bigint] NOT NULL,
                            [TelegramID] [bigint] NULL,
                            [is_bot] [bit] NULL,
                            [username] [nvarchar](max) NULL,
                            [first_name] [nvarchar](max) NULL,
                            [last_name] [nvarchar](max) NULL,
                            [content_type] [nvarchar](10) NOT NULL,
                            [user_message] [nvarchar](max) NULL,
                            [RequestedAt] DATETIME2(0) NOT NULL DEFAULT GETDATE()
                    )
                    """)

    cursor.close()
    mydb.close()

    print("6. Tables in database created")

def make_user(default_path):
    command = "CREATE LOGIN " + username + " WITH PASSWORD = '" + str(password) + "'"
    cursor.execute(command)
    cursor.close()
    mydb.close()

    print("7. Tech user created")

if __name__ == "__main__":
    try:
        default_path = "C:\\BOT\\"
        default_data_path = "C:\\BOT\\DATA\\"
        
        create_path(default_path, default_data_path)
        copy(default_path)
    
        libs_install()

        config_maker(default_path, default_data_path)
        config = ConfigParser()
        config.read(default_path + "config.ini")
        
        import pyodbc
        server = config["bot_api"]["server_name"]
        username = config["bot_api"]["db_username"]
        password = config["bot_api"]["db_password"]

        mydb = pyodbc.connect(r'Driver=SQL Server;Server='+server+';Trusted_Connection=yes;')
        mydb.autocommit = True
        cursor = mydb.cursor()
        
        make_db(default_path)
        make_tables(default_path)
        make_user(default_path)

        input("Bot successfully installed. Press any button...")
    except Exception as e:
        print("Error:", e)
