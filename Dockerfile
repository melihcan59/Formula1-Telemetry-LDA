
FROM python:3.12-rc-alpine

# Metadata
LABEL maintainer="Arian Ott"
LABEL version="0.1"
LABEL license="MIT"
LABEL description="Dockerfile for Jupyter Notebook with Python 3.12-rc-alpine3.14"


WORKDIR /app


ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1


COPY requirements.txt .


RUN apk add --no-cache \
    bash \
    build-base \
    linux-headers \
    libffi-dev \
    openssl-dev \
    jpeg-dev \
    zlib-dev \
    freetype-dev \
    libpng-dev \
    musl-dev \
    gcc \
    g++ \
    libxml2-dev \
    libxslt-dev \
    sqlite-dev \
    && pip install --no-cache-dir -r requirements.txt


RUN pip install --no-cache-dir jupyter

RUN rm /app/requirements.txt


COPY . .


CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
