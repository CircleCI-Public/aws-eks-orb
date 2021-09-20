#!/bin/bash
if which aws-iam-authenticator > /dev/null; then
    echo "AWS IAM Authenticator for Kubernetes is already installed"
    exit 0
fi
PLATFORM="linux"
if [ -n "$(uname | grep "Darwin")" ]; then
    PLATFORM="darwin"
fi
RELEASE_TAG="<< parameters.release-tag >>"
#RELEASE_URL="https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases/latest"
FILENAME="aws-iam-authenticator"
VERSION=$(curl -Ls --fail --retry 3 -o /dev/null -w %{url_effective} "https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/latest" | sed 's:.*/::' | sed 's/v//g')
if [ -n "${RELEASE_TAG}" ]; then
    VERSION="${RELEASE_TAG}"
    if [ "${VERSION}" == "0.3.0" ]; then
    FILENAME="heptio-authenticator-aws"
    fi
fi
# extract version number
VERSION_NUMBER=$(echo "$VERSION" | cut -c 2-)
DOWNLOAD_URL="https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/${VERSION}/${FILENAME}_${VERSION_NUMBER}_${PLATFORM}_amd64"
$SUDO echo "HERE IS THE DOWNLOAD URL:" "$DOWNLOAD_URL"
curl -L --fail --retry 3 -o aws-iam-authenticator "$DOWNLOAD_URL"
chmod +x ./aws-iam-authenticator
SUDO=""
if [ "$(id -u)" -ne 0 ] && which sudo > /dev/null ; then
    SUDO="sudo"
fi
$SUDO mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
