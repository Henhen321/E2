FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm i && npm i -g qrcode-terminal && unzip sessions.zip

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
