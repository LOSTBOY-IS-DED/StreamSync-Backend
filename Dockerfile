
FROM node:22-alpine

RUN npm install -g pnpm

WORKDIR /app

COPY package.json pnpm-lock.yaml ./



RUN pnpm install

COPY . .

RUN pnpm run build


CMD ["pnpm", "run", "dev"]
