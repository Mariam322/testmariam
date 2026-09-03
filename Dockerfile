FROM node:22-alpine AS build
WORKDIR /src
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
# Trouve automatiquement le dossier qui contient index.html
# (gere dist/<nom>/browser, dist/<nom> ou dist) et le met dans /out.
RUN set -e; D=$(dirname $(find dist -name index.html | head -1)); mkdir -p /out && cp -a "$D"/. /out/

FROM nginx:1.27-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /out/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
