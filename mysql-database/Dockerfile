FROM mysql:8

ENV MYSQL_ROOT_PASSWORD=123456
ENV MYSQL_DATABASE=onlinetutors

COPY onlinetutors.sql /docker-entrypoint-initdb.d/
