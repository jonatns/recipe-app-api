FROM python:3.8-alpine
LABEL Jonathan Navarrete

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir app
WORKDIR /app
COPY ./app .

RUN adduser -D user
USER user