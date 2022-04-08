#!/bin/bash
if which aws-iam-authenticator > /dev/null; then
    echo "AWS IAM Authenticator for Kubernetes is already installed"
    exit 0
fi
PLATFORM="linux"
if uname | grep -q 'Darwin' 
then
    PLATFORM="darwin"
fi
FILENAME="aws-iam-authenticator"
if [ -n "${PARAM_RELEASE_TAG}" ]; then
   export RELEASE_TAG=${!PARAM_RELEASE_TAG}
   VERSION="${RELEASE_TAG}"
   if [ "${VERSION}" == "0.3.0" ]; then
   FILENAME="heptio-authenticator-aws"
   fi
   DOWNLOAD_URL="https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${VERSION}/${FILENAME}_${VERSION}_${PLATFORM}_amd64"
else
   versions_raw=$(curl -Ls --fail --retry 3  "https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases"  | grep tag_name |  awk -F ":" '{print $2}')
   IFS=', ' read -ra versions <<<$(echo ${versions_raw//$'\n'/} | tr -d '"') 
   for i in "${!versions[@]}"
    do
      ver=$(echo ${versions[i]} | sed 's/v//g')
      DOWNLOAD_URL="https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${ver}/aws-iam-authenticator_${ver}_${PLATFORM}_amd64"
      status_code=$(curl --write-out %{http_code} --silent --output /dev/null $DOWNLOAD_URL)
      if [[ "$status_code" -eq 302 ]] ; then
	break
      fi
   done
fi
curl -L --fail --retry 3 -o aws-iam-authenticator "$DOWNLOAD_URL"
chmod +x ./aws-iam-authenticator
if [ "$(id -u)" -ne 0 ] && which sudo > /dev/null ; then
    SUDO="sudo"
fi
$SUDO mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
