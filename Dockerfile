FROM ruby:3.1.2-slim-bullseye

LABEL Name=rubytestapp Version=0.0.1

WORKDIR /app

RUN gem install bundler

RUN apt-get update && \
    apt-get install -y \
    build-essential 
COPY Gemfile Gemfile.lock ./

RUN bundle install && \
    rails db:seed

COPY . /app

EXPOSE 3000

CMD ["puma"]