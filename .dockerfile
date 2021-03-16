FROM alpine:3.13

# install essential

RUN apk add --no-cache --update \
		openssl wget curl \
	&& echo hosts: dns files > /etc/nsswitch.conf

# install common

RUN apk add --no-cache --update \
		sudo tzdata \
		unzip zip tar gzip xz upx \
		\
		zsh zsh-vcs ncurses \
		zsh-autosuggestions \
		zsh-syntax-highlighting \
		exa dust jq \
		neovim \
		\
		dropbear-ssh \
		git \
		pass gnupg \
		\
		python3 python3-dev py3-pip \
		\
		linux-headers alpine-sdk

# install additional tooling

RUN echo '@edge-testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
	&& apk add --no-cache --update \
		kubectl@edge-testing \
		minio-client@edge-testing

# create user

RUN adduser -s /bin/zsh -D ambrose \
	&& echo '' >> /etc/sudoers \
	&& echo '## No password sudo' >> /etc/sudoers \
	&& echo 'ambrose ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# install dotfiles

WORKDIR /home/ambrose
COPY --chown=ambrose:ambrose . .

# switch to user

USER ambrose

# install user programs

RUN mkdir ~/.config/nvim/autoload/
RUN wget -O ~/.config/nvim/autoload/plug.vim --force-directories \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN pip3 install --no-cache-dir --user thefuck
RUN pip3 install --no-cache-dir --user httpie

# open login shell by default

CMD ["/bin/zsh", "-l"]

# vim: set ft=dockerfile:
