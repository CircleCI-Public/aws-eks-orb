#!/bin/bash
# set smart sudo
if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi

# Define current platform
if [[ "$(uname -s)" == "Darwin" && "$(uname -m)" == "x86_64" ]]; then
	export SYS_ENV_PLATFORM=macos
elif [[ "$(uname -s)" == "Linux" && "$(uname -m)" == "x86_64" ]]; then
	export SYS_ENV_PLATFORM=linux_x86
elif [[ "$(uname -s)" == "Linux" && "$(uname -m)" == "aarch64" ]]; then
	export SYS_ENV_PLATFORM=linux_arm
else
	echo "This platform appears to be unsupported."
	uname -a
	exit 1
fi

if ! command -v eksctl >/dev/null 2>&1; then
	echo "Installing the AWS eksctl CLI"
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_$(uname -m).tar.gz" | tar xz -C /tmp
    $SUDO mv /tmp/eksctl /usr/local/bin
	# Validate install.
	echo
	command -v eksctl
	echo "AWS eksctl CLI installed"
else
	echo "AWS eksctl CLI is already installed."
fi
