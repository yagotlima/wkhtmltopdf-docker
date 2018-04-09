FROM ubuntu:xenial
LABEL maintainer="Yago Toledo Lima <yagotoledolima@gmail.com>"

WORKDIR /install

RUN apt-get update \
    && apt-get install -y zlib1g fontconfig libfreetype6 libx11-6 libxext6 \
        libxrender1 libssl1.0.0 curl xz-utils

RUN curl -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz --output wkhtmltox.tar.xz\
    && tar --xz -xf wkhtmltox.tar.xz\
    && cp wkhtmltox/bin/* /usr/local/bin/

WORKDIR /output

# Cleanup
RUN rm -fr /install

ENTRYPOINT ["wkhtmltopdf"]
CMD ["-h"]
