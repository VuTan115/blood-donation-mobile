FROM node:18-alpine

RUN mkdir -p /home/app

COPY . /home/app

WORKDIR "/home/app"

RUN yarn install


CMD ["yarn", "start"]