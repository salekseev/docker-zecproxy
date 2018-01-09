FROM node:alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY zecproxy ./
COPY config.json ./

RUN mkdir -p /etc/ssl/certs \
 && apk --no-cache add ca-certificates \
 && update-ca-certificates \
 && npm install --only=production

EXPOSE 8000

CMD [ "node", "proxy.js" ]
