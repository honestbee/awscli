FROM python:3-alpine

ENV AWSCLI_VERSION "1.11.69"

RUN apk add --no-cache jq bash curl git
RUN pip install awscli==$AWSCLI_VERSION

