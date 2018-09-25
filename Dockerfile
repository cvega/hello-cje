FROM ruby:2.5.1

LABEL mainter "bcolfer@zendesk.com"

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app
ADD Gemfile.lock /app
ADD .ruby-version /app

RUN bundle install --deployment

ADD hello.rb /app

ENV HELLO_PORT 8080

EXPOSE $HELLO_PORT

ENTRYPOINT [ "bundle", "exec", "ruby", "hello.rb" ]

