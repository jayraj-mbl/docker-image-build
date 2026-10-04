FROM nginx:alpine

# Copy the entire contents of the web1 folder into the NGINX HTML directory
COPY ./web1/ /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]