FROM ruby:3.2-bullseye as base

RUN apt-get update && apt-get install -y build-essential apt-utils libpq-dev nodejs

RUN useradd -ms /bin/bash usuario
USER usuario

WORKDIR /docker/app
COPY --chown=usuario:usuario . /docker/app

RUN gem install bundler && bundle install 

RUN gem install foreman

EXPOSE 3000

CMD ["foreman", "start"]
