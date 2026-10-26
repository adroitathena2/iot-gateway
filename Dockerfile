FROM alpine:3.20

# busybox httpd ships in busybox-extras on Alpine; page served by the hub's health endpoint
RUN apk add --no-cache busybox-extras \
 && mkdir -p /www && echo "Smart Hub Online" > /www/index.html

EXPOSE 80

# Announce startup, then serve /www with busybox httpd in the foreground on port 80
CMD ["sh", "-c", "echo 'Smart Hub Online' && exec httpd -f -v -p 80 -h /www"]
