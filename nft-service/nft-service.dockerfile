FROM alpine:3.20

WORKDIR /app

COPY nftServiceApp ./nftServiceApp
COPY configs/ ./configs/

RUN chmod +x ./nftServiceApp

ENTRYPOINT ["./nftServiceApp"]
