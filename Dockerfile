FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./ 
RUN npm run build

FROM nginx
#elasticbean stalk will map directly to the port specified by the expose command for incoming traffic
EXPOSE 80 
#basically means come from the other phase to the new directory
COPY --from=builder /app/build /usr/share/nginx/html