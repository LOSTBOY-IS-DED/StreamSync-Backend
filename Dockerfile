
FROM node:22-alpine

WORKDIR /usr/local/app


COPY package.json pnpm-lock.yaml ./


RUN npm install -g pnpm


COPY . .


CMD ["pnpm", "run", "dev"]
