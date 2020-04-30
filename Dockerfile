# Build Stage
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase for prod server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Start nginx runs by default with nginx base image