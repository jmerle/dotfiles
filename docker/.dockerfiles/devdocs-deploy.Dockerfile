FROM ruby:2.6.5-alpine

ENV LANG=C.UTF-8
ENV ENABLE_SERVICE_WORKER=true

LABEL traefik.enable=true
LABEL traefik.port=9292

WORKDIR /devdocs

COPY Gemfile Gemfile.lock /devdocs/

RUN apk --update add nodejs build-base libstdc++ gzip git zlib-dev libcurl && \
    gem install bundler && \
    bundle install --system --without test && \
    apk del gzip build-base git zlib-dev && \
    rm -rf /var/cache/apk/* /tmp ~/.gem /root/.bundle/cache \
    /usr/local/bundle/cache /usr/lib/node_modules

COPY Thorfile config.ru /devdocs/
COPY public /devdocs/public
COPY views /devdocs/views
COPY lib /devdocs/lib
COPY assets /devdocs/assets

RUN thor assets:compile

EXPOSE 9292
ENTRYPOINT ["rackup", "-o", "0.0.0.0"]
