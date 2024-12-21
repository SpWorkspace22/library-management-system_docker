FROM python:3.14.0a3-alpine3.21
COPY requirements.txt requirements.txt
RUN pip installl -r requirements.txt
WORKDIR lms_app
COPY . .
ENTRYPOINT ["flask","run","app.py","--host:0.0.0.0"]