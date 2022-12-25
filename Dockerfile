# base image  
FROM python:3.8   
ENV PYTHONUNBUFFERED 1

WORKDIR /app

ADD . /app

COPY . /app

COPY ./urlshortener/requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

RUN python ./urlshortener/manage.py makemigrations

RUN python ./urlshortener/manage.py migrate

EXPOSE 8000   

CMD python ./urlshortener/manage.py runserver 0.0.0.0:8000
