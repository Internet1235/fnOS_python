FROM debian:12

WORKDIR /app
COPY python/ /app/

ARG PYTHON_VERSION=3.12.13
ARG PYTHON_DIR=python312

RUN apt-get update && apt install -y build-essential zlib1g-dev libncurses5-dev libbz2-dev libssl-dev libncurses-dev libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev liblzma-dev libffi-dev gcc make openssl wget rsync \
    && tar -xvf Python-${PYTHON_VERSION}.tar.xz \
    && cd Python-${PYTHON_VERSION} \
    && ./configure --prefix=/var/apps/${PYTHON_DIR}/target --enable-optimizations \
    && make -j16 && make install
