Description
===========

_[Hi, have a look at the blog post](http://devblog.springest.com/testing-big-infrastructure-changes-at-springest/)_

__From the makers of [Gor](https://github.com/buger/gor):__

> Gor is a simple http traffic replication tool written in Go. Its main goal is to replay traffic from production servers to staging and dev environments.
>
> Gor consists of 2 parts: listener and replay servers.
>
> The listener server catches http traffic from a given port in real-time and sends it to the replay server. The replay server forwards traffic to a given address.

![chart](https://github-camo.global.ssl.fastly.net/556d4aa5db32de9535d84d6c6c07f6564b43fc0b/687474703a2f2f692e696d6775722e636f6d2f396d716a32534b2e706e67)


Requirements
============

A Unix environment. Tested on Ubuntu, but any Linux, Unix, MacOS system should work.

Attributes
==========

```ruby
default['gor']['role']            = 'listen'            # or 'replay'
default['gor']['listen']['port']  = 80                  # port to listen on for http traffic  
default['gor']['forward']['host'] = node[:ip_address]   # hostname or ip to forward to
default['gor']['replay']['host']  = node[:ip_address]   # hostname or ip to replay on
default['gor']['replay']['port']  = 28020               # port for the replay server
```

Usage
=====

Say you want to capture traffic from `live.example.com:80` and replay it on `staging.example.com:80`.

## Configure your listener node on live.example.com:

```ruby
node['gor']['role']            = 'listen'
node['gor']['listen']['port']  = 80
node['gor']['forward']['host'] = 'staging.example.com'
node['gor']['replay']['port']  = 28020
```

### Or in json:

```json
"gor": {
  "role": "listen",
  "forward": { "host": "staging.example.com" },
  "replay":  { "port": "28020" }
}
```

## Configure your replayer on staging.example.com:

```ruby
node['gor']['role']           = 'replay'
node['gor']['replay']['host'] = 'http://staging.example.com'
node['gor']['replay']['port'] = 28020
```

### Or in json:

```json
"gor": {
  "role": "replay",
  "replay": { "host": "http://staging.example.com", "port": "28020" }
}
```
