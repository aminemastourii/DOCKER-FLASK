FROM ubuntu
 
RUN apt-get update 
RUN apt-get install -y python3 python3-pip
 
RUN pip3 install --break-system-packages flask
 
COPY app.py /opt/app.py

ENV FLASK_APP=/opt/app.py

ENTRYPOINT ["flask","run","--host=0.0.0.0"]
