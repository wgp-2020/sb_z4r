FROM alpine

ENV PORT=80
ENV UUID="1eb6e917-774b-4a84-aff6-b058577c60a5"
ENV PATH="/vless"

EXPOSE 80
COPY ./ /app
WORKDIR /app
CMD chmod +x * && ./init.sh