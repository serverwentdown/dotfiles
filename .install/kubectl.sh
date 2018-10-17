#!/bin/sh

set -e
source ./.versions

echo
echo "Installing kubectl $KUBECTL_VERSION..."
echo

sudo apk add --no-cache --virtual .build-deps \
	curl

mkdir -p  ~/.local/bin
curl -fLo ~/.local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl
chmod a+x ~/.local/bin/kubectl

sudo apk del .build-deps
