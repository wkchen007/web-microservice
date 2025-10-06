FROM alpine:latest

RUN mkdir /app

COPY listenServiceApp /app

CMD [ "/app/listenServiceApp"]