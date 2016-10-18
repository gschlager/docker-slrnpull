FROM alpine:3.4
MAINTAINER Gerhard Schlager <mail@gerhard-schlager.at>

ENV SLRN_VERSION pre1.0.3-16

RUN apk add --update --no-cache musl slang
RUN apk add --update --no-cache --virtual builddeps g++ make ncurses-libs slang-dev && \
    wget http://www.jedsoft.org/snapshots/slrn-$SLRN_VERSION.tar.gz && \
    tar xvf slrn-$SLRN_VERSION.tar.gz && \
    rm slrn-$SLRN_VERSION.tar.gz && \
    cd slrn-$SLRN_VERSION && \
    ./configure --with-docdir=/usr/share/doc/slrn \
                --with-slrnpull=/var/spool/slrnpull && \
    make && \
    make install && \
    cd / && \
    rm -r slrn-$SLRN_VERSION && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man && \
    apk del builddeps

VOLUME /var/spool/slrnpull
ENTRYPOINT ["/usr/local/bin/slrnpull"]
