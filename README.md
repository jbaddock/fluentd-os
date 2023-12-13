# Why this repo?
This repo uses the fluentd repo's as the source, and adds additional plugins.  A workflow runs daily to check for updates.  Also working to expand my knowledge.

# FluentD w/ Opensearch-plugin
<a href="(https://github.com/fluent/fluentd" target="_blank">fluentd on Github</a>.  This docker container is built with the following plugins:</br>
- [opensearch output plugin](https://github.com/fluent/fluent-plugin-opensearch)
- [docker](https://github.com/edsiper/fluent-plugin-docker)
- [geoip filter](https://github.com/y-ken/fluent-plugin-geoip)
- [beats input](https://github.com/repeatedly/fluent-plugin-beats)

# Docker Hub
[jbaddock/fluentd](https://hub.docker.com/r/jbaddock/fluentd-os)

#### Docker Run ####
`docker run -d --name fluentd -p 24224:24224 -p 24224:24224/udp --restart unless-stopped -v "CHANGEYOURDIR/fluentd/conf:/fluentd/etc" jbaddock/fluentd`

#### Docker compose ####
```yml
version: "2.1"
services:
  fluentd:
    image: jbaddock/fluentd
    container_name: fluentd
    ports:
        - "24224:24224"
        - "24224:24224/udp"
    restart: unless-stopped
    volumes:
        - ./fluentd/conf:/fluentd/etc
```
