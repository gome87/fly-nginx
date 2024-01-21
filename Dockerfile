FROM nginx

RUN apt-get update && apt-get install -y apache2-utils

COPY index.html /usr/share/nginx/html/
COPY entrypoint.sh /entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY apple-app-site-association /.well-known/apple-app-site-association
COPY apple-app-site-association /apple-app-site-association

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]