FROM python:3.7-alpine 

LABEL mantainer="nire.it.dev"
LABEL project="AppPython"

WORKDIR /usr/src/app
EXPOSE 8080

COPY app .

RUN python -m pip install -r requirements.txt

CMD [ "python", "-u", "main.py" ]
