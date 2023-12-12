FROM ruby:latest

USER root

# Update the container
RUN apt-get update 

# Install Fluentd and dependencies
RUN gem install fluentd
RUN fluentd -s conf
RUN fluentd -c conf/fluent.conf & echo '{"json":"message"}' | fluent-cat debug.test

# Install plugin dependencies
RUN apt-get install -y build-essential libgeoip-dev libmaxminddb-dev

# Install plugins
RUN gem install fluent-plugin-opensearch --no-document
RUN gem install fluent-plugin-beats --no-document
RUN gem install fluent-plugin-docker --no-document
RUN gem install fluent-plugin-concat --no-document
RUN gem install fluent-plugin-parser --no-document

# Cleanup
RUN rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem /home/fluent/.gem/ruby/*/cache/*.gem
USER fluent