
FROM node:22-alpine

WORKDIR /usr/local/app


COPY package.json pnpm-lock.yaml ./


RUN npm install -g pnpm

RUN pnpm install

COPY . .

RUN pnpm run build


CMD ["pnpm", "run", "dev"]
