#!/bin/bash
mkdir -p /tmp/artifacts

echo "$PARAM_CLUSTER_NAME 
$PARAM_CONFIG_FILE
$PARAM_CONFIG_FILE
$PARAM_AWS_REGION
$PARAM_AWS_PROFILE
$PARAM_WAIT
$PARAM_CFN_ROLE_ARN
$PARAM_VERBOSE
$PARAM_AWS_MAX_POLLING_WAIT_TIME" >> test.txt


CLUSTER_NAME=$(eval echo "$PARAM_CLUSTER_NAME")
CONFIG_FILE=$(eval echo "$PARAM_CONFIG_FILE")
AWS_REGION=$(eval echo "$PARAM_AWS_REGION")
AWS_PROFILE=$(eval echo "$PARAM_AWS_PROFILE")
WAIT=$(eval echo "$PARAM_WAIT")
CFN_ROLE_ARN=$(eval echo "$PARAM_CFN_ROLE_ARN")
VERBOSE=$(eval echo "$PARAM_VERBOSE")
AWS_MAX_POLLING_WAIT_TIME=$(eval echo "$PARAM_AWS_MAX_POLLING_WAIT_TIME")


if [ -n "${CLUSTER_NAME}" ]; then
    set -- "$@" --name="${CLUSTER_NAME}"
fi
if [ -n "${CONFIG_FILE}" ]; then
    set -- "$@" --config-file="${CONFIG_FILE}"
fi
if [ -n "${AWS_REGION}" ]; then
    set -- "$@" --region="${AWS_REGION}"
fi
if [ -n "${AWS_PROFILE}" ]; then
    set -- "$@" --profile="${AWS_PROFILE}"
fi
if [ "${WAIT}" == "true" ]; then
    set -- "$@" --wait
fi
if [ -n "${CFN_ROLE_ARN}" ]; then
    set -- "$@" --cfn-role-arn="${CFN_ROLE_ARN}"
fi
if [ -n "${AWS_MAX_POLLING_WAIT_TIME}" ]; then
    set -- "$@" --timeout="${AWS_MAX_POLLING_WAIT_TIME}"
fi
set -- "$@" --verbose="${VERBOSE}"

if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
    set -x
fi

eksctl delete cluster "$@"

if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
    set +x
fi
