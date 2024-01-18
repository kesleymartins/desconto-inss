FROM ruby:3.2-bullseye as base

RUN apt-get update && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN useradd -ms /bin/bash usuario
RUN chown -R usuario:usuario /docker/app/*
RUN chown -R usuario:usuario /usr/local/bundle

USER usuario

RUN bundle install

ADD . /docker/app

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

CMD [ "bundle","exec", "puma", "config.ru"] # CMD ["rails","server"] # you can also write like this.
