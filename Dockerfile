FROM jruby:9.3

RUN apt-get update -y && apt-get install netbase -y

ENV WORKDIR=/app
WORKDIR ${WORKDIR}

COPY Gemfile* ./
RUN bundle install -j4

COPY public ./public
COPY config ./config
COPY db.rb app.rb config.ru ./

EXPOSE 9292

# CMD rackup -o0 -Eproduction
CMD rackup -o0
