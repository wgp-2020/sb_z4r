FROM nginx:alpine

EXPOSE 80
COPY ./ /app
WORKDIR /app

CMD chmod +x * && ./init.sh