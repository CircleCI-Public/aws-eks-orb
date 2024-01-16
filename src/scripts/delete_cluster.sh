#!/bin/bash
AWS_EKS_STR_CLUSTER_NAME="$(echo "${AWS_EKS_STR_CLUSTER_NAME}" | circleci env subst)"
AWS_EKS_STR_CONFIG_FILE="$(echo "${AWS_EKS_STR_CONFIG_FILE}" | circleci env subst )"
AWS_EKS_STR_REGION="$(echo "${AWS_EKS_STR_REGION}" | circleci env subst)"
AWS_EKS_STR_PROFILE="$(echo "${AWS_EKS_STR_PROFILE}" | circleci env subst)"
AWS_EKS_STR_CFN_ROLE_ARN="$(echo "${AWS_EKS_STR_CFN_ROLE_ARN}" | circleci env subst)"
AWS_EKS_STR_MAX_POLLING_WAIT_TIME="$(echo "${AWS_EKS_STR_MAX_POLLING_WAIT_TIME}" | circleci env subst)"


if [ -n "${AWS_EKS_STR_CLUSTER_NAME}" ]; then
    set -- "$@" --name="${AWS_EKS_STR_CLUSTER_NAME}"
fi
if [ -n "${AWS_EKS_STR_CONFIG_FILE}" ]; then
    set -- "$@" --config-file="${AWS_EKS_STR_CONFIG_FILE}"
fi
if [ -n "${AWS_EKS_STR_REGION}" ]; then
    set -- "$@" --region="${AWS_EKS_STR_REGION}"
fi
if [ -n "${AWS_EKS_STR_PROFILE}" ]; then
    set -- "$@" --profile="${AWS_EKS_STR_PROFILE}"
fi
if [ "${AWS_EKS_BOOL_WAIT}" == "true" ]; then
    set -- "$@" --wait
fi
if [ -n "${AWS_EKS_STR_CFN_ROLE_ARN}" ]; then
    set -- "$@" --cfn-role-arn="${AWS_EKS_STR_CFN_ROLE_ARN}"
fi
if [ -n "${AWS_EKS_STR_MAX_POLLING_WAIT_TIME}" ]; then
    set -- "$@" --timeout="${AWS_EKS_STR_MAX_POLLING_WAIT_TIME}"
fi
set -- "$@" --verbose="${AWS_EKS_INT_VERBOSE}"

if [ "$AWS_EKS_BOOL_EKSCTL_COMMAND" == "1" ]; then
    set -x
fi

eksctl delete cluster "$@"

if [ "$AWS_EKS_BOOL_EKSCTL_COMMAND" == "1" ]; then
    set +x
fi
