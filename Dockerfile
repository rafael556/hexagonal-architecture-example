FROM golang:1.22

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

RUN go install github.com/golang/mock/mockgen@v1.6.0 && \
apt-get update && apt-get install sqlite3 -y && \
usermod -u 1000 www-data  && \
mkdir -p /var/www/.cache  && \
chown -R www-data:www-data /go  && \
chown -R www-data:www-data /var/www/.cache
USER www-data

CMD ["tail", "-f", "/dev/null"]