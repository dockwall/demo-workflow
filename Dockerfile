FROM node:alpine AS build-stage

WORKDIR '/app'

COPY ./package.json ./
RUN npm i

COPY ./ ./
RUN npm run build

FROM nginx AS run-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html