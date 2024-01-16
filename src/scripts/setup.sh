#!/bin/bash

AWS_EKS_STR_VERSION="$(echo "${AWS_EKS_STR_VERSION}" | circleci env subst)"

if which eksctl > /dev/null; then
    echo "The AWS eksctl CLI is already installed"
    exit 0
fi

eval "$SCRIPT_UTILS"
detect_arch
detect_os
set_sudo


if [ -n "${AWS_EKS_STR_VERSION}" ]; then
 	download_url="https://github.com/eksctl-io/eksctl/releases/download/v${AWS_EKS_STR_VERSION/v/}/eksctl_${PLATFORM}_${ARCH}.tar.gz"
else
 	download_url="https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_${PLATFORM}_${ARCH}.tar.gz"
fi

echo "Installing the AWS eksctl CLI"
set -x
curl --silent --location "$download_url" | tar xz -C /tmp
set +x
$SUDO mv /tmp/eksctl /usr/local/bin

# Validate install.
command -v eksctl
echo "AWS eksctl CLI installed"

