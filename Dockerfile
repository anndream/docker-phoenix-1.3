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

RUN apt-get update && apt-get install -y --no-install-recommends \
		autoconf \
		automake \
		bzip2 \
		file \
		g++ \
		gcc \
		imagemagick \
		libbz2-dev \
		libc6-dev \
		libcurl4-openssl-dev \
		libdb-dev \
		libevent-dev \
		libffi-dev \
		libgdbm-dev \
		libgeoip-dev \
		libglib2.0-dev \
		libjpeg-dev \
		libkrb5-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libmysqlclient-dev \
		libncurses-dev \
		libpng-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libtool \
		libwebp-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		patch \
		xz-utils \
		zlib1g-dev \
		&& rm -rf /var/lib/apt/lists/*


# Add local node module binaries to PATH
ENV PATH=./node_modules/.bin:$PATH
WORKDIR $HOME
