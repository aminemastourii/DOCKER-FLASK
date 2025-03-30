FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip3 install  --no-cache-dir -r requirements.txt
 
COPY app.py .

ENV FLASK_APP=app.py

EXPOSE 5000

ENTRYPOINT ["flask","run","--host=0.0.0.0"]
