FROM python:3.8-alpine
LABEL Jonathan Navarrete

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt .
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .build-deps \
  gcc libc-dev linux-headers postgresql-dev \
  && pip install -r requirements.txt \
  && apk del .build-deps

RUN mkdir app
WORKDIR /app
COPY ./app .

RUN adduser -D user
USER user