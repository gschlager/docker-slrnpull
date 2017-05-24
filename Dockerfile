FROM alpine:3.5
MAINTAINER Gerhard Schlager <mail@gerhard-schlager.at>

RUN apk add --update --no-cache musl slang
RUN apk add --update --no-cache --virtual builddeps g++ make ncurses-libs slang-dev && \
    wget http://jedsoft.org/releases/slrn/slrn-1.0.3a.tar.bz2 && \
    tar xjf slrn-1.0.3a.tar.bz2 && \
    rm slrn-1.0.3a.tar.bz2 && \
    cd slrn-1.0.3 && \
    ./configure --with-docdir=/usr/share/doc/slrn \
                --with-slrnpull=/var/spool/slrnpull && \
    make && \
    make install && \
    cd / && \
    rm -r slrn-1.0.3 && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man && \
    apk del builddeps

VOLUME /var/spool/slrnpull
ENTRYPOINT ["/usr/local/bin/slrnpull"]
