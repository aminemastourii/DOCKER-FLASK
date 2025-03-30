import os
from flask import Flask
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    connection = mysql.connector.connect(
        host=os.environ.get("DB_HOST", "db"),
        user=os.environ.get("DB_USER", "amine"),
        password=os.environ.get("DB_PASSWORD", "mastouri"),
        database=os.environ.get("DB_NAME", "flask_db")
    )
    return connection

@app.route('/')
def hello_world():
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT 'Amine y7areb f docker '")
    result = cursor.fetchone()
    connection.close()
    return str(result[0])

if __name__ == "__main__":
    app.run(host='0.0.0.0')
