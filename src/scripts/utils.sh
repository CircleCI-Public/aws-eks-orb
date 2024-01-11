#!/bin/bash
detect_os() { 
  detected_platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

  case "$detected_platform" in
    linux*)
      printf '%s\n' "Detected OS: Linux."
      PLATFORM="linux"
      ;;
    darwin*)
      printf '%s\n' "Detected OS: macOS."
      PLATFORM="darwin"
      ;;
    *)
      printf '%s\n' "Unsupported OS: \"$detected_platform\"."
      exit 1
      ;;
  esac

  export PLATFORM
}

detect_arch() {
    detected_arch="$(uname -m)"
    
    case "$detected_arch" in
        x86_64 | amd64) ARCH=amd64 ;;
        arm64 | aarch64) ARCH=arm64 ;;
        *) return 1 ;;
    esac

    export ARCH
}

set_sudo () {
    if [ "$(id -u)" -ne 0 ] && which sudo > /dev/null ; then
        SUDO="sudo"
    fi

    export SUDO
}

detect_latest_version (){
    VERSION="$(curl -Ls --fail --retry 3 -o /dev/null -w '%{url_effective}' "https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/latest" | sed 's:.*/v::')"
    echo "Latest version is $VERSION"
    
    export VERSION
}