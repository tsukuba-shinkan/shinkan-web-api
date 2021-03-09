FROM node:14.16-alpine3.10

COPY package.json package-lock.json ./
RUN npm ci

COPY tsconfig.json launch.sh ./
COPY src ./src
RUN npm run build

CMD "./launch.sh"
