FROM ubuntu:20.04

RUN apt update && apt install -y \
        git \
        build-essential && \
    git clone https://github.com/jfriesse/omping.git && \
    cd omping && make && cp omping /usr/bin && \
    apt remove -y \
        git \
        build-essential && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "omping" ] 