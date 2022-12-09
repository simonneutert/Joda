FROM jruby:9.4-jdk17

RUN apt-get update -y && apt-get install netbase -y

ENV WORKDIR=/app
WORKDIR ${WORKDIR}

COPY Gemfile* ./
RUN bundle install -j4

COPY views ./views
COPY config ./config
COPY public ./public
COPY db.rb app.rb config.ru ./

EXPOSE 9292

# CMD rackup -o0 -Eproduction
CMD rackup -o0
