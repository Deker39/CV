from connector import *
import datetime

CREATE_TABLE_USER = 'id int auto_increment primary key,' \
                    'login varchar(255) not null,' \
                    'password varchar(255)not null,' \
                    'user_name varchar(255)'

CREATE_TABLE_NOTE = 'id int auto_increment primary key,' \
                    'name_note varchar(255),' \
                    'notes varchar(255),' \
                    'user_id int,' \
                    'date_creat datetime,' \
                    'data_edit datetime,' \
                    'foreign key (user_id) references user(id)'

DATABASE = 'notebook'
TABLE_USER = 'user'
TABLE_NOTE = 'note'
USER_COLUMNS = "login, password, user_name"
NOTE_COLUMNS = "name_note, notes, user_id, date_creat, data_edit"
time_format = "%d-%m-%Y"


def output_notes(func):
    def wrapper(*args, **kwargs):
        user_name, notes = func(*args, **kwargs)
        print('There is no data') if not notes \
            else print(f'Name: {user_name}'), \
            [print(f'{note[0]}:\n'
                   f'\t{note[1]}\n'
                   f'created: {note[2].strftime(time_format)}\n',
                   f'edited: {note[3].strftime(time_format)}\n' if note[2] != note[3] else ''
                   ) for note in notes]
        return func
    return wrapper


def notes_output_decorator(func):
    def wrapper(user_name, notes):
        print('There is no data') if not notes \
            else print(f'Name: {user_name}'), \
            [print(f'{note[0]}:\n'
                   f'\t{note[1]}\n'
                   f'created: {note[2].strftime(time_format)}\n',
                   f'edited: {note[3].strftime(time_format)}\n' if note[2] != note[3] else ''
                   ) for note in notes]
        return func(user_name, notes)
    return wrapper


def print_menu(func):
    def inner():
        print('\nWork with the note\n')
        print('1.Add note\n'
              '2.Delete note\n'
              '3.Edit note\n'
              '4.Show note\n'
              '5.Show note by date (from to)\n'
              '6.Show a note that contains keywords\n'
              '7.Exit\n')
        return func()

    return inner


@print_menu
def menu():
    return int(input('Choose: '))


def choose_menu(db, login):
    choose = menu()

    while choose != 7:

        if choose == 1:
            add_note(db, login)
            choose = menu()
        elif choose == 2:
            del_note(db, login)
            choose = menu()
        elif choose == 3:
            edit_note(db, login)
            choose = menu()
        elif choose == 4:
            show_note(db, login)
            choose = menu()
        elif choose == 5:
            show_note_time(db, login)
            choose = menu()
        elif choose == 6:
            show_note_key_words(db, login)
            choose = menu()
        else:
            print('Incorrect value')


def check_database(db, database_name):
    return True if db.fetchall(f'SHOW DATABASES LIKE "{database_name}"') else False


def check_table(db, table_name):
    return True if db.fetchall(f'SHOW TABLES FROM {DATABASE} LIKE "{table_name}"') else False


def check_login(db, login):
    return True if db.select(f'{DATABASE}.{TABLE_USER}', 'login', f'login = "{login}"') else False


def check_pass(db, password):
    return True if db.select(f'{DATABASE}.{TABLE_USER}', 'password', f'password = "{password}"') else False


def check_id_user(db, login):
    return db.select(f'{DATABASE}.{TABLE_USER}', 'id', f'login = "{login}"')[0][0]


def check_user_name(db, login):
    return db.select(f'{DATABASE}.{TABLE_USER}', 'user_name', f'login = "{login}"')[0][0]


def add_note(db, login):
    name_note = input('Enter name note: ')
    note = input('Enter note: ')
    date_now = datetime.datetime.now().strftime("%Y-%d-%m")
    db.insert(f'{DATABASE}.{TABLE_NOTE}', NOTE_COLUMNS, "'{}', '{}', '{}', '{}', '{}'".
              format(name_note,
                     note,
                     db.select(f'{DATABASE}.{TABLE_USER}', 'id', f'login = "{login}"')[0][0],
                     date_now,
                     date_now))
    print('Entry added')


def del_note(db, login):
    name_note = input('Enter name note: ')
    id_user = check_id_user(db, login)
    db.delete(f'{DATABASE}.{TABLE_NOTE}', f'name_note = "{name_note}" AND user_id = {id_user}')
    print('note to delete')


def edit_note(db, login):
    date_now = datetime.datetime.now().strftime("%Y-%d-%m")
    name_note = input('Enter name note: ')
    id_user = check_id_user(db, login)
    old_note = db.select(f'{DATABASE}.{TABLE_NOTE}', 'notes', f'user_id = {id_user} and name_note = "{name_note}"')
    print(f'Content:\n\t{old_note[0][0]}')
    new_note = input('Enter new note: ')
    db.update(f'{DATABASE}.{TABLE_NOTE}', f'notes = "{new_note}", data_edit = "{date_now}"',
              f'user_id = {id_user} and name_note = "{name_note}"')
    print('note updated')


@output_notes
def show_note(db, login):
    id_user = check_id_user(db, login)
    user_name = check_user_name(db, login)
    db.select(f'{DATABASE}.{TABLE_NOTE}', 'name_note, notes, date_creat, data_edit', f'user_id = {id_user}')
    return user_name, db.select(f'{DATABASE}.{TABLE_NOTE}', 'name_note, notes, date_creat, data_edit',
                                f'user_id = {id_user}')


@output_notes
def show_note_time(db, login):
    id_user = check_id_user(db, login)
    user_name = check_user_name(db, login)
    print('Enter the start date of the period')
    day_f, month_f, year_f = input('Enter a day: '), input('Enter a month: '), input('Enter a year: ')
    print('Now enter the end date of the period')
    day_t, month_t, year_t = input('Enter a day: '), input('Enter a month: '), input('Enter a year: ')
    return user_name, db.select(f'{DATABASE}.{TABLE_NOTE}',
                                'name_note, notes, date_creat, data_edit',
                                f'user_id = {id_user} and '
                                f'date_creat between "{"-".join([year_f, day_f, month_f])}" and "{"-".join([year_t, day_t, month_t])}" or '
                                f'user_id = {id_user} and '
                                f'data_edit between "{"-".join([year_f, day_f, month_f])}" and "{"-".join([year_t, day_t, month_t])}"')


@output_notes
def show_note_key_words(db, login):
    id_user = db.select(f'{DATABASE}.{TABLE_USER}', 'id', f'login = "{login}"')[0][0]
    user_name = check_user_name(db, login)
    key_words = input('Enter keywords through "," : ')
    query_like = ''
    for i in key_words.split(","):
        query_like += f'notes like "{i.lstrip().rstrip()}" or '
    return user_name, db.select(f'{DATABASE}.{TABLE_NOTE}',
                                'name_note, notes, date_creat, data_edit',
                                f'user_id = {id_user} and {query_like.rstrip("or ")}')


def authorization(db):
    # TODO test value
    # login, password, nickname = 'alex', '123', 'deker'
    login = input('Please enter your login: ')
    if not check_login(db, login):
        print('you are new user')
        password = input('Please enter your password: ')
        nickname = input('Please enter your nickname: ')
        db.insert(f'{DATABASE}.{TABLE_USER}', USER_COLUMNS, "'{}', '{}', '{}'".format(login, password, nickname))
        print('your account added to database')
        choose_menu(db, login)

    else:
        # password = '123'
        password = input('Please enter your password: ')

        while not check_pass(db, password):
            print('yor pass not correct')
            password = input('Please enter your password: ')

        choose_menu(db, login)

    print('App closed')


def main():
    db = Database()

    if not check_database(db, DATABASE):
        db.create_database(DATABASE)
        print('creat db')
    else:
        print('bd has been created')

    if not check_table(db, TABLE_USER):
        db.create_table(f'{DATABASE}.{TABLE_USER}', CREATE_TABLE_USER)
        print('user table creat')
    else:
        print('user table has been created')

    if not check_table(db, TABLE_NOTE):
        db.create_table(f'{DATABASE}.{TABLE_NOTE}', CREATE_TABLE_NOTE)
        print('note table creat')
    else:
        print('note table has been created')

    authorization(db)


if __name__ == '__main__':
    main()
