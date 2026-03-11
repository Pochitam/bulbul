FROM gcc:11 AS builder

WORKDIR /bulbul

COPY . .

RUN g++ -std=c++14 -O3 -static -s -o my-app *.cpp

FROM alpine:latest

RUN apk add --no-cache

WORKDIR /bulbul

COPY --from=builder /bulbul/my-app .

RUN chmod +x ./my-app

CMD ["./my-app"]
