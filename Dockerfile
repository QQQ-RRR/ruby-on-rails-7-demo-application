FROM ruby:slim

LABEL Name=rubyonrails7demoapplication Version=0.0.1

EXPOSE 3000

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["ruby", "rubyonrails7demoapplication.rb"]
