FROM nginx:1.25
EXPOSE 80
COPY ./public/ /usr/share/nginx/html/
