
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html

HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost/ || exit 1
