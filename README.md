# Joda 🖖 == JRuby + Roda

And here it is 🎉 My template for Ruby's notorious web router [Roda](https://roda.jeremyevans.net) - running on the JVM ([JRuby](https://www.jruby.org))! 🌋

Start the server with `$ rackup`, then benchmark as unscientifically as possible (but easy as pie), using [HTTPie](https://httpie.io):

`$ time http :9292/jsondata >/dev/null`

## Why though?

I cannot really say why JRuby intriqued me, since I fell in love with Ruby.  
But, at least for me, JRuby isn't especially beginner friendly. 😬  
Something didn't work. Very tough to google.  
Java docs?! Java ecosystem?! They do what? How on earth? Cheesus ... 🤢

## This repository is aimed at

- curious Rubyists, struggling to find a use case of getting something up with [JRuby](https://www.jruby.org)
- those who want get hold of JRuby, without the suspicious feeling that Rails takes care of everything behind the curtains (it's why we love you, Rails, you know that! 😘)
- People curious of [Roda](https://roda.jeremyevans.net)
- PORO lovers
- [Rack](https://github.com/rack/rack) fanboys
- [Sinatra](https://sinatrarb.com) / [Fastify](https://www.fastify.io) / [FastAPI](https://fastapi.tiangolo.com) / [Gin](https://github.com/gin-gonic/gin)
- Java people / JVM users ☕️
- those on a journey, they don't know, they are on: Ruby ➡ JRuby ➡ [Clojure](https://clojure.org/guides/getting_started) ☮️

## Run

if one of you gets this going on another OS, please submit a PR with some handy notes ✌️

### Docker

- `$ docker build . -t joda`
- `$ docker run --rm -it -p9292:9292 joda`

### MacOS and asdf

please, see the docs of your [asdf-vm](https://asdf-vm.com) java plugin ([docs of the default java plugin 📖](https://github.com/halcyon/asdf-java#java_home)). It's about JRuby having Java in it's PATH.

Then fire the following commands:

- `$ asdf install java microsoft-17.35.1`
- `$ asdf reshim`
- `$ asdf install ruby jruby-9.3.6.0`
- `$ bundle install -j4`
- `$ jruby -S rackup`

## Profiling JRuby

`$ jruby --profile.graph -S rackup`

## JVM Options

This is how you could use it for production:
`$ jruby -J-Xmx512m --server -S rackup -E production`

- minimum and maximum Java heap size to 512 MB
- optimization for server ON
- runs Rack in production mode

or:

`$ jruby -J-Xms2g -J-Xmx2g --server -J-Djruby.thread.pool.enabled=true -S rackup -E production`

---

#### SEO

Tags/Keywords: Ruby, JRuby, Java, Roda, Sequel, JDBC, REST, API, JSON

#### Other

- large file json taken from https://github.com/json-iterator/test-data/blob/master/large-file.json
