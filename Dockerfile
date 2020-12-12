FROM debian:stable

ARG USERID
RUN adduser --uid ${USERID:-1000} --gecos "" --disabled-password exercism && \
    apt-get update && \
    apt-get install -y curl && \ 
    curl -L https://github.com/exercism/cli/releases/download/v3.0.13/exercism-3.0.13-linux-x86_64.tar.gz --output exercism-3.0.13-linux-x86_64.tar.gz && \
    mkdir exercism-3.0.13-linux-x86_64 && \
    tar xfz exercism-3.0.13-linux-x86_64.tar.gz -C ./exercism-3.0.13-linux-x86_64 && \
    cp exercism-3.0.13-linux-x86_64/exercism /usr/local/bin/ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /app && \
    chown exercism /app

WORKDIR /home/exercism/src
USER exercism

ENTRYPOINT ["/usr/local/bin/exercism"]
