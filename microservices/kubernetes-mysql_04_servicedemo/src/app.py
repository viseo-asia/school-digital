from flask import Flask
from flask import jsonify
import socket
import os
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = os.environ['MYSQL_HOST']
app.config['MYSQL_USER'] = os.environ['MYSQL_USER']
app.config['MYSQL_PASSWORD'] = os.environ['MYSQL_PASSWORD']
app.config['MYSQL_DB'] = os.environ['MYSQL_DATABASE']

mysql = MySQL(app)


@app.route("/")
def statusGet():
    print("GET /")
    # Init
    cursor = mysql.connection.cursor()
    cursor.execute(
        ''' CREATE TABLE IF NOT EXISTS visitors(visit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP) ''')
    cursor.execute(
        ''' INSERT INTO visitors (visit_date) value (CURRENT_TIMESTAMP) ''')
    cursor.execute(''' SELECT count(*) as nb_visitors FROM visitors ''')
    mysql.connection.commit()
    return jsonify({'visits': cursor.fetchall()[0][0], 'hostname': socket.gethostname()})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("8080"))
