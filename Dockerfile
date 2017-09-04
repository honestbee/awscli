FROM python:alpine3.6

ENV AWSCLI_VERSION "1.11.145"

RUN apk add --no-cache jq bash curl git wget && \
pip install awscli==$AWSCLI_VERSION
