#!/bin/bash

apt-get update -y

apt-get install -y python3-pip

pip3 install flask
pip3 install mysql-connector-python

mkdir -p /opt/app

cat > /opt/app/app.py << 'EOF'
from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

db = mysql.connector.connect(
    host="10.167.0.3",
    user="appuser",
    password="Sweety#18",
    database="appdb"
)

@app.route("/employees", methods=["GET"])
def get_employees():

    cur = db.cursor()

    cur.execute(
        "SELECT id,name,department,salary FROM employees"
    )

    rows = cur.fetchall()

    return jsonify(rows)

@app.route("/employee", methods=["POST"])
def add_employee():

    data = request.json

    cur = db.cursor()

    cur.execute(
        """
        INSERT INTO employees
        (name,department,salary)
        VALUES(%s,%s,%s)
        """,
        (
            data["name"],
            data["department"],
            data["salary"]
        )
    )

    db.commit()

    return {"status":"success"}

app.run(
    host="0.0.0.0",
    port=8080
)
EOF

nohup python3 /opt/app/app.py > /var/log/flask.log 2>&1 &