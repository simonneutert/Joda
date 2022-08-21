FROM jruby:9.3.7

RUN apt-get update -y && apt-get install netbase -y

WORKDIR /app

ADD Gemfile* .
RUN bundle install -j4

COPY public /app/public
COPY db.rb app.rb config.ru /app/

EXPOSE 9292

CMD rackup -o 0