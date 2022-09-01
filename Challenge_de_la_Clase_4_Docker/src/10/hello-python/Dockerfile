FROM python:3.11-alpine
RUN pip install flask
RUN pip install pika
COPY app.py /home/myapp/
EXPOSE 8080

RUN apk add wait4x
CMD wait4x tcp  mq:5672 -t 10m &&  python3 /home/myapp/app.py
