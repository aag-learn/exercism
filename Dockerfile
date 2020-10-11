FROM debian:stable

RUN apt-get update && \
    apt-get install -y curl bats vim && \ 
    curl -L https://github.com/exercism/cli/releases/download/v3.0.13/exercism-3.0.13-linux-x86_64.tar.gz --output exercism-3.0.13-linux-x86_64.tar.gz && \
    mkdir exercism-3.0.13-linux-x86_64 && \
    tar xfz exercism-3.0.13-linux-x86_64.tar.gz -C ./exercism-3.0.13-linux-x86_64 && \
    cp exercism-3.0.13-linux-x86_64/exercism /usr/local/bin/ && \
    mkdir /app && \
    apt-get clean

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/exercism"]
