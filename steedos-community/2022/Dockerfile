FROM node:14

WORKDIR /app

ADD services ./services/
ADD package.json .
ADD moleculer.config.js .
ADD steedos-config.yml .

ENV NODE_ENV=production

RUN yarn --production

CMD ["yarn", "start"]
