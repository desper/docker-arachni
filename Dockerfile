FROM debian:8

ENV VERSION 1.4
ENV WEB_VERSION 0.5.10

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN mkdir /arachni && \
    wget -qO- https://github.com/Arachni/arachni/releases/download/v${VERSION}/arachni-${VERSION}-${WEB_VERSION}-linux-x86_64.tar.gz | tar xvz -C /arachni --strip-components=1

WORKDIR /arachni

RUN sed -i "s|config.ru|config.ru -o 0.0.0.0|g" bin/arachni_web

EXPOSE 9292
