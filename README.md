# Joda 🖖 == JRuby + Roda

And here it is 🎉 My template for Ruby's notorious web router [Roda](https://roda.jeremyevans.net) - running on the JVM ([JRuby](https://www.jruby.org))! 🌋

Start the server with `$ rackup`, then benchmark (see below) as unscientifically as possible (but easy as pie), using [HTTPie](https://httpie.io):

`$ time http :9292/jsondata >/dev/null`  
sucks 25mb from your server 🧛‍♀️

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

## Benchmarks 🥼🧪💻

**FIRST OF ALL** the JVM had some requests before the benchs to warm up a little  
**BUT** let's be honest the server wasn't fresh and had already other stuff to do  
**AND** had 2 just cores (but 8 gigs of RAM 😅)
**AND** it's for sure I missed an opportunity for tweaking something  
**BECAUSE** the JVM still is completely new to me at this point  
**SO** this is worthless, but some just need the numbers

well, enough whining...

- [ab](https://httpd.apache.org/docs/2.4/programs/ab.html) (comes pre-installed on MacOS)
- [wrk](https://github.com/wg/wrk) (i.e. `$ brew install wrk`)

### Benchmarking with [ab](https://httpd.apache.org/docs/2.4/programs/ab.html):

`$ ab -n 1000 -c 10 -k -H "Accept-Encoding: gzip, deflate" "https://joda.test.test/hello/world"`

```bash
This is ApacheBench, Version 2.3 <$Revision: 1879490 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking joda.test.test (be patient)
[...shortened...]

Server Software:
Server Hostname:        joda.test.test
Server Port:            443
SSL/TLS Protocol:       TLSv1.2,ECDHE-RSA-CHACHA20-POLY1305,4096,256
Server Temp Key:        ECDH X25519 253 bits
TLS Server Name:        joda.test.test

Document Path:          /hello/world
Document Length:        38 bytes

Concurrency Level:      10
Time taken for tests:   11.268 seconds
Complete requests:      1000
Failed requests:        0
Keep-Alive requests:    0
Total transferred:      166000 bytes
HTML transferred:       38000 bytes
Requests per second:    88.74 [#/sec] (mean)
Time per request:       112.685 [ms] (mean)
Time per request:       11.268 [ms] (mean, across all concurrent requests)
Transfer rate:          14.39 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:       49   78  14.4     77     137
Processing:    12   33  22.0     22     113
Waiting:       11   23  12.1     17      77
Total:         64  111  26.2    105     244

Percentage of the requests served within a certain time (ms)
  50%    105
  66%    117
  75%    126
  80%    131
  90%    151
  95%    164
  98%    176
  99%    186
 100%    244 (longest request)
```

### Benchmarking with [wrk](https://github.com/wg/wrk):

`$ wrk -t10 -c10 -d30s "https://joda.test.test/hello/world"`

```bash
Running 30s test @ https://joda.test.test/hello/world
  10 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    23.21ms   15.14ms  81.68ms   84.52%
    Req/Sec    46.87     15.47    80.00     62.34%
  14065 requests in 30.10s, 2.07MB read
Requests/sec:    467.21
Transfer/sec:     70.28KB
```

#### Device

|                       |                                     |
| --------------------- | ----------------------------------- |
| Model Name            | MacBook Pro                         |
| Model Identifier      | MacBookPro18,1                      |
| Chip                  | Apple M1 Pro                        |
| Total Number of Cores | 10 (8 performance and 2 efficiency) |
| Memory                | 16 GB                               |

## Thought Section

Entering this fancy new rabbit hole, here's what didn't work, or may well be served with butter in the future

#### Database

- H2 database will crash when load testing these routes and throw horrifying errors, I propose you use Postgres/MySQL/AnyOtherProperDB for mimicking "real-life" server simulation

#### Roda

there's so much beauty in Roda, so it would be nice to showcase more of it.

I suggest you stumble through the Website

- [Roda's Website](https://roda.jeremyevans.net)
- Federico's and [Avdi](https://avdi.codes)'s Book: [Mastering Roda](https://fiachetti.gitlab.io/mastering-roda/)
- [Jeremy Evans' Code Lair](https://code.jeremyevans.net/ruby.html) (sequel, rodauth, and many more)

---

#### Credits

- large file json taken from:  
  https://github.com/json-iterator/test-data/blob/master/large-file.json

#### SEO Stuff 🤭

Tags/Keywords: Ruby, JRuby, Java, Roda, Sequel, JDBC, Puma, REST, API, JSON
