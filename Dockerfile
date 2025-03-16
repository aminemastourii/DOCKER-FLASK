FROM ubuntu

RUN apt update
RUN apt install -y python3 python3-setuptools python3-dev build-essential python3-pip python3-mysqldb

RUN pip3 install flask
RUN pip3 install flask-mysql

COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0