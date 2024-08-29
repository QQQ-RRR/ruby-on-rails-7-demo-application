#Stage1 building 
FROM ruby:3.1.2-slim-bullseye AS builder
LABEL Name=rubytestapp Version=0.0.1
WORKDIR /app
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libpq-dev
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install     
#Stage2 Final
FROM ruby:3.1.2-slim-bullseye AS final 
WORKDIR /app
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /usr/lib/x86_64-linux-gnu/ /usr/lib/x86_64-linux-gnu/
COPY . /app
EXPOSE 3000
CMD ["config/run.sh"]