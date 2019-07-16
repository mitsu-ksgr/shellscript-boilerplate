FROM alpine:3.7

COPY ./entrypoint.sh /entrypoint.sh
COPY ./boilerplates /boilerplates

ENTRYPOINT ["sh", "/entrypoint.sh"]

