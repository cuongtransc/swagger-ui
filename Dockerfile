FROM alpine:3.4

MAINTAINER Cuong Tran "tranhuucuong91@gmail.com"

RUN apk add --update nginx
RUN mkdir -p /run/nginx

COPY nginx-config/nginx.tmpl.conf /etc/nginx/nginx.tmpl.conf

# ENV VERSION "v2.2.10"
ENV FOLDER "swagger-ui-2.2.10"
ENV API_URL "http://petstore.swagger.io/v2/swagger.json"
ENV API_KEY "**None**"
ENV OAUTH_CLIENT_ID "**None**"
ENV OAUTH_CLIENT_SECRET "**None**"
ENV OAUTH_REALM "**None**"
ENV OAUTH_APP_NAME "**None**"
ENV OAUTH_ADDITIONAL_PARAMS "**None**"
ENV SWAGGER_JSON "/usr/share/nginx/html/swagger.json"
# ENV PORT 8080
# ENV VALIDATOR_URL null

# Default password: coc:coc@123
ENV HTPASSWD 'coc:$apr1$e9q4IX2q$NoJl9ygUOAPwtm0NaUpWR1'

# Copy swagger files to the `/js` folder
COPY ./dist/* /usr/share/nginx/html/
COPY ./docker-run.sh /usr/share/nginx/

EXPOSE 8080

CMD ["sh", "/usr/share/nginx/docker-run.sh"]
