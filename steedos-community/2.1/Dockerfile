FROM node:14-slim

RUN apt-get update || : && apt-get install -y \
    python \
    build-essential

WORKDIR /app

ADD services ./services/
ADD package.json .
ADD moleculer.config.js .
ADD steedos-config.yml .

ENV NODE_ENV=production

RUN yarn --production && yarn cache clean

CMD ["yarn", "start"]
