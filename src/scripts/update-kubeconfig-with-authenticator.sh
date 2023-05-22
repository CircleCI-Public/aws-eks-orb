#!/bin/bash
ORB_EVAL_CLUSTER_NAME=$(circleci env subst "$ORB_EVAL_CLUSTER_NAME")
ORB_EVAL_AWS_REGION=$(circleci env subst "$ORB_EVAL_AWS_REGION")
ORB_EVAL_AWS_PROFILE=$(circleci env subst "$ORB_EVAL_AWS_PROFILE")
ORB_EVAL_KUBECONFIG_FILE_PATH=$(circleci env subst "$ORB_EVAL_KUBECONFIG_FILE_PATH")
ORB_EVAL_ROLE_ARN=$(circleci env subst "$ORB_EVAL_ROLE_ARN")
ORB_EVAL_CLUSTER_CONTEXT_ALIAS=$(circleci env subst "$ORB_EVAL_CLUSTER_CONTEXT_ALIAS")
ORB_EVAL_DRY_RUN=$(circleci env subst "$ORB_EVAL_DRY_RUN")

if [ -n "${ORB_EVAL_CLUSTER_NAME}" ]; then
    set -- "$@" --name "${ORB_EVAL_CLUSTER_NAME}"
fi
if [ -n "${ORB_EVAL_AWS_REGION}" ]; then
    set -- "$@" --region "${ORB_EVAL_AWS_REGION}"
fi
if [ -n "${ORB_EVAL_AWS_PROFILE}" ]; then
    set -- "$@" --profile "${ORB_EVAL_AWS_PROFILE}"
fi
if [ -n "${ORB_EVAL_KUBECONFIG_FILE_PATH}" ]; then
    set -- "$@" --kubeconfig "${ORB_EVAL_KUBECONFIG_FILE_PATH}"
fi
if [ -n "${ORB_EVAL_ROLE_ARN}" ]; then
    set -- "$@" --role-arn "${ORB_EVAL_ROLE_ARN}"
fi
if [ -n "${ORB_EVAL_CLUSTER_CONTEXT_ALIAS}" ]; then
    set -- "$@" --alias "${ORB_EVAL_CLUSTER_CONTEXT_ALIAS}"
fi
if [ -n "${ORB_EVAL_DRY_RUN}" ]; then
    set -- "$@" --dry-run "${DRY_RUN}"
fi
if [ "${ORB_VAL_VERBOSE}" == "true" ]; then
    set -- "$@" --verbose
fi

aws eks update-kubeconfig "$@"
