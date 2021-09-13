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

if ! command -v gh >/dev/null 2>&1; then
	echo "Installing the GitHub CLI"
	case $SYS_ENV_PLATFORM in
		linux_x86)
            curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
            $SUDO mv /tmp/eksctl /usr/local/bin
			;;
		*)
		echo "This orb does not currently support your platform. If you believe it should, please consider opening an issue on the GitHub repository:"
		echo "https://github.com/CircleCI-Public/aws-eks-orb"
		exit 1
	;;
	esac
	# Validate install.
	echo
	echo "AWS eksctl CLI installed"
	command -v eksctl
else
	echo "AWS eksctl CLI is already installed."
fi
