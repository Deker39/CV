import mysql.connector


class Database:
    def __init__(self):
        self.host = 'localhost'
        self.username = 'root'
        self.password = '26091998@Asd'
        self.conn = None
        self.cursor = None

    def connect(self):
        self.conn = mysql.connector.connect(
            host=self.host,
            user=self.username,
            password=self.password
        )
        self.cursor = self.conn.cursor()

    def disconnect(self):
        if self.conn:
            self.conn.close()
        self.conn = None
        self.cursor = None

    def execute(self, query, params=None):
        self.connect()
        self.cursor.execute(query, params)
        self.conn.commit()
        self.disconnect()

    def fetchall(self, query, params=None):
        self.connect()
        self.cursor.execute(query, params)
        result = self.cursor.fetchall()
        self.disconnect()
        return result

    def create_database(self, database_name):
        self.execute(f"CREATE DATABASE IF NOT EXISTS {database_name}")
        self.disconnect()

    def create_table(self, table_name, columns):
        self.execute(f"CREATE TABLE {table_name} ({columns})")
        self.disconnect()

    def select(self, table_name, columns="*", condition=""):
        query = f"SELECT {columns} FROM {table_name}"
        if condition:
            query += f" WHERE {condition}"
        return self.fetchall(query)

    def insert(self, table_name, columns, values):
        query = f"INSERT INTO {table_name} ({columns}) VALUES ({values})"
        self.execute(query)

    def update(self, table_name, set_values, condition=""):
        query = f"UPDATE {table_name} SET {set_values}"
        if condition:
            query += f" WHERE {condition}"
        self.execute(query)

    def delete(self, table_name, condition=""):
        query = f"DELETE FROM {table_name}"
        if condition:
            query += f" WHERE {condition}"
        self.execute(query)
