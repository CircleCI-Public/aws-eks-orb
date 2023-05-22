#!/bin/bash
ORB_EVAL_CLUSTER_NAME=$(eval echo "$ORB_EVAL_CLUSTER_NAME")
ORB_EVAL_CONFIG_FILE=$(eval echo "$ORB_EVAL_CONFIG_FILE")
ORB_EVAL_AWS_REGION=$(eval echo "$ORB_EVAL_AWS_REGION")
ORB_EVAL_AWS_PROFILE=$(eval echo "$ORB_EVAL_AWS_PROFILE")
ORB_EVAL_CFN_ROLE_ARN=$(eval echo "$ORB_EVAL_CFN_ROLE_ARN")
ORB_EVAL_AWS_MAX_POLLING_WAIT_TIME=$(eval echo "$ORB_EVAL_AWS_MAX_POLLING_WAIT_TIME")


if [ -n "${ORB_EVAL_CLUSTER_NAME}" ]; then
    set -- "$@" --name="${ORB_EVAL_CLUSTER_NAME}"
fi
if [ -n "${ORB_EVAL_CONFIG_FILE}" ]; then
    set -- "$@" --config-file="${ORB_EVAL_CONFIG_FILE}"
fi
if [ -n "${ORB_EVAL_AWS_REGION}" ]; then
    set -- "$@" --region="${ORB_EVAL_AWS_REGION}"
fi
if [ -n "${ORB_EVAL_AWS_PROFILE}" ]; then
    set -- "$@" --profile="${ORB_EVAL_AWS_PROFILE}"
fi
if [ "${ORB_VAL_WAIT}" == "true" ]; then
    set -- "$@" --wait
fi
if [ -n "${ORB_EVAL_CFN_ROLE_ARN}" ]; then
    set -- "$@" --cfn-role-arn="${ORB_EVAL_CFN_ROLE_ARN}"
fi
if [ -n "${ORB_EVAL_AWS_MAX_POLLING_WAIT_TIME}" ]; then
    set -- "$@" --timeout="${ORB_EVAL_AWS_MAX_POLLING_WAIT_TIME}"
fi
set -- "$@" --verbose="${ORB_VAL_VERBOSE}"

if [ "$ORB_VAL_SHOW_EKSCTL_COMMAND" == "1" ]; then
    set -x
fi

eksctl delete cluster "$@"

if [ "$ORB_VAL_SHOW_EKSCTL_COMMAND" == "1" ]; then
    set +x
fi
