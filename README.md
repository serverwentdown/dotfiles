
# env [![Build Status](https://ci.makerforce.io/api/badges/ambrose/env/status.svg)](https://ci.makerforce.io/ambrose/env)

Just storing dotfiles in a repository isn't enough. This is almost all the tools I use, put into a Docker image that I can run anywhere

## Todo

- [ ] i3bar
- [ ] macOS support?

## Usage

### Docker

```sh
export PATH="$HOME/.local/bin:$PATH"
curl -fLo ~/.local/bin/runenv https://raw.githubusercontent.com/serverwentdown/env/master/.local/bin/runenv
chmod +x ~/.local/bin/runenv
runenv -h
```

### macOS

```sh
brew install \
	wget \
	xz \
	gnupg \
	git \
	zsh \
	neovim \
	python \
	go \
	node \
	\
	pass
brew cask install \
	java8 \
	docker \
	iterm2-nightly \
	bitbar \
	firefoxnightly
./.install/dircolors.sh
./.install/pure.sh
pip3 install --user thefuck
./.install/zsh-autosuggestions.sh
./.install/zsh-syntax-highlighting.sh
./.install/plug.sh
./.install/yadm.sh
# pass is installed using homebrew
./.install/packr.sh
./.install/caddy.sh
./.install/httpie.sh
./.install/kubectl.sh
./.install/minio-client.sh
./.install/yarn.sh
yadm clone git@github.com:serverwentdown/env.git
```

## Optional

```sh
# requires private key
yadm decrypt
# requires yadm decrypt
git clone git@makerforce.io:ambrose/pass.git ~/.password-store
# takes up a lot of space
sudo ./.install/jdk.sh && sudo ./.install/gradlr.sh
# for desktop environments only
sudo ./.install/desktop.sh && sudo ./.install/firefox.sh
```

## Maintenance

Keep `.install` synchronised with Dockerfile. Check with:

```sh
for f in .install/*; do grep $f .dockerfile -q || echo "Missing: $f"; done
```

