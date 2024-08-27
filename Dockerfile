FROM ruby:3.1.2

LABEL Name=rubyonrails7demoapplication Version=0.0.1

EXPOSE 3000

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install
RUN rails db:seed

CMD [ "puma"]