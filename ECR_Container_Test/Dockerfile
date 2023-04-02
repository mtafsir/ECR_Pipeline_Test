FROM golang:1.19.7-alpine3.17

# Setup AWS CLI
RUN apk --no-cache add curl
RUN apk add aws-CLI

# Add chromium
RUN apk add chromium

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go get -u github.com/chromedp/chromedp
RUN go build -o main .

WORKDIR /
CMD ["tail", "-f", "/dev/null"]