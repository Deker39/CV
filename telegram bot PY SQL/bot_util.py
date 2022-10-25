from datetime import datetime
from configparser import ConfigParser
import json


config = ConfigParser()
config.read("config.ini")


def checker(data):
    if data == None:
        return None
    else:
        return data

def null_checker(data):
    if data == None:
        return ""
    else:
        return data

def global_info(message):
    row = (
        checker(message.chat.id),
        checker(message.from_user.id),
        checker(message.from_user.is_bot),
        checker(message.from_user.username),
        checker(message.from_user.first_name),
        checker(message.from_user.last_name),
        checker(message.content_type),
        checker(message.text),
        checker(message.caption)
        )

    return row

def logger_tess(data, i):
    dt = datetime.now().strftime("%d.%m.%y_%H-%M-%S")
    with open(config['bot_api']['path2log'] + dt + '_' + '{:04}'.format(i) + '.txt', 'w', encoding='utf-8') as f:
        for row in data:
            #f.write(json.dumps(str(data), indent=4) + '\n')
            f.write(str(row) + '\n')
    
