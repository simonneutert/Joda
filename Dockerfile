FROM jruby:10-jdk21

RUN apt-get update -y && apt-get install netbase libjemalloc2 build-essential -y

ENV WORKDIR=/app
WORKDIR ${WORKDIR}

COPY Gemfile ./
RUN bundle install -j4

COPY views ./views
COPY config ./config
COPY public ./public
COPY db.rb app.rb config.ru ./

EXPOSE 9292

CMD ["bundle", "exec", "puma", "-t", "4:16", "-p", "9292", "-e", "production", "--preload"]
