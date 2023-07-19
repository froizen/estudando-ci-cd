FROM python:3.9-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    nginx \
    python3-dev \
    build-essential \
    libpq-dev

WORKDIR /app

COPY /app/requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

COPY app .

EXPOSE 5000
CMD [ "python", "app.py" ]