#!/bin/bash
CLUSTER_NAME=$(eval echo "$PARAM_CLUSTER_NAME")
AWS_REGION=$(eval echo "$PARAM_AWS_REGION")
AWS_PROFILE=$(eval echo "$PARAM_AWS_PROFILE")
KUBECONFIG_FILE_PATH=$(eval echo "$PARAM_KUBECONFIG_FILE_PATH")
ROLE_ARN=$(eval echo "PARAM_ROLE_ARN")
CLUSTER_CONTEXT_ALIAS=$(eval echo "$PARAM_CLUSTER_CONTEXT_ALIAS")
DRY_RUN=$(eval echo "$PARAM_DRY_RUN")
VERBOSE=$(eval echo "$PARAM_VERBOSE")

if [[ $(id -u) -ne 0 ]]; then
    SUDO="sudo"
else
    SUDO=""
fi

if [ -n "${CLUSTER_NAME}" ]; then
    set -- "$@" --name "${CLUSTER_NAME}"
fi
if [ -n "${AWS_REGION}" ]; then
    set -- "$@" --region "${AWS_REGION}"
fi
if [ -n "${AWS_PROFILE}" ]; then
    set -- "$@" --profile "${AWS_PROFILE}"
fi
if [ -n "${KUBECONFIG_FILE_PATH}" ]; then
    set -- "$@" --kubeconfig "${KUBECONFIG_FILE_PATH}"
fi
if [ -n "${ROLE_ARN}" ]; then
    set -- "$@" --role-arn "${ROLE_ARN}"
fi
if [ -n "${CLUSTER_CONTEXT_ALIAS}" ]; then
    set -- "$@" --alias "${CLUSTER_CONTEXT_ALIAS}"
fi
if [ "${DRY_RUN}" == "true" ]; then
    set -- "$@" --dry-run
fi
if [ "${VERBOSE}" == "true" ]; then
    set -- "$@" --verbose
fi
$SUDO aws eks update-kubeconfig "$@"
