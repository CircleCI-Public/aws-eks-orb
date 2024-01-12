#!/bin/bash
set -x
AWS_EKS_STR_RELEASE_TAG="$(echo "${AWS_EKS_STR_RELEASE_TAG}" |  circleci env subst)"

if which aws-iam-authenticator > /dev/null; then
    echo "AWS IAM Authenticator for Kubernetes is already installed"
    exit 0
fi

eval "$SCRIPT_UTILS"
detect_os
detect_arch
set_sudo

FILENAME="aws-iam-authenticator"

if [ -n "${AWS_EKS_STR_RELEASE_TAG}" ]; then
    VERSION="${AWS_EKS_STR_RELEASE_TAG}"
    if [ "${VERSION}" == "0.3.0" ]; then
        FILENAME="heptio-authenticator-aws"
    fi
else
    detect_latest_version
fi

DOWNLOAD_URL="https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${VERSION/v/}/${FILENAME}_${VERSION/v/}_${PLATFORM}_${ARCH}"

printf "Downloading version %s\n"  "${VERSION}"

curl -L --fail --retry 3 -o aws-iam-authenticator "$DOWNLOAD_URL"
chmod +x ./aws-iam-authenticator

$SUDO mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
set +x