FROM node:22-alpine

COPY package.json package.json
COPY pnpm-lock.yaml pnpm-lock.yaml

WORKDIR /usr/local/app

COPY . .

RUN npm install -g pnpm

RUN pnpm install

CMD [ "npm", "run" , "dev" ]