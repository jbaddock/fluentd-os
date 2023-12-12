# FluentD w/ Opensearch-plugin
[fluentd](https://github.com/fluent/fluentd) docker container with the following plugins
- [opensearch output plugin](https://github.com/fluent/fluent-plugin-opensearch)
- [docker](https://github.com/edsiper/fluent-plugin-docker)
- [geoip filter](https://github.com/y-ken/fluent-plugin-geoip)
- [beats input](https://github.com/repeatedly/fluent-plugin-beats)

<br>
<div align="center">
![GitHub repo size](https://img.shields.io/github/repo-size/jbaddock/fluentd-os?label=Repo%20Size&logo=github)
![Docker Pulls](https://img.shields.io/docker/pulls/jbaddock/fluentd-os)
![Docker Size](https://img.shields.io/docker/image-size/jbaddock/fluentd-os)
</div>
#### Docker Run
`docker run --rm --name fluentd -v ./conf:/fluentd/etc -p 9292:9292 -p 24224:24224 -p 24224:24224/udp jbaddock/fluentd-os`

#### Docker compose #
```yml
version: "3"
services:
  fluentd
    name: fluentd
    restart: unless-stopped
    image: jbaddock/fluentd-os
    ports:
      - "24224:24224"
      - "24224:24224/udp"
      - "9292:9292"          # Web UI
    volumes:
      - ./conf:/fluentd/etc
```
