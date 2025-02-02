ARG TAG

FROM postgres:${TAG}

RUN wget -qO- https://github.com/iCyberon/pg_hashids/archive/master.tar.gz | tar xzf - -C /tmp && \
    apk add --no-cache --virtual .build-deps make gcc libc-dev postgresql-dev && \
    make -C /tmp/pg_hashids-master && \
    make -C /tmp/pg_hashids-master install && \
    rm -rf /tmp/pg_hashids-master && \
    apk del .build-deps
