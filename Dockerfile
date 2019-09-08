FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
#basically means come from the other phase to the new directory
COPY --from=builder /app/build /usr/share/nginx/html