FROM ruby:2.5.1

RUN apt-get update -qq && \
    apt-get install -y apt-utils build-essential apt-transport-https mysql-client libxml2-dev

RUN bundle config path /usr/local/bundle
ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
