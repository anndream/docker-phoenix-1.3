FROM elixir:1.4.5
MAINTAINER William Tran <chitran.whitecat@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/opt/app/ TERM=xterm

RUN mix local.hex --force \
 && mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new-1.3.0.ez \
 && apt-get update \
 && curl -sL https://deb.nodesource.com/setup_6.x | bash \
 && apt-get install -y apt-utils \
 && apt-get install -y nodejs \
 && apt-get install -y build-essential \
 && apt-get install -y inotify-tools \
 && mix local.rebar --force

RUN apt-get -y install imagemagick --fix-missing

# Add local node module binaries to PATH
ENV PATH=./node_modules/.bin:$PATH \

WORKDIR /opt/app
