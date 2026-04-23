FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY catapult-dist/ /usr/share/nginx/html/

EXPOSE 80
