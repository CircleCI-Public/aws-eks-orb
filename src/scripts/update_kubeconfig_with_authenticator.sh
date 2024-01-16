#!/bin/bash
AWS_EKS_STR_CLUSTER_NAME=$(circleci env subst "$AWS_EKS_STR_CLUSTER_NAME")
AWS_EKS_STR_REGION=$(circleci env subst "$AWS_EKS_STR_REGION")
AWS_EKS_STR_PROFILE=$(circleci env subst "$AWS_EKS_STR_PROFILE")
AWS_EKS_EVAL_KUBECONFIG_FILE_PATH=$(circleci env subst "$AWS_EKS_EVAL_KUBECONFIG_FILE_PATH")
AWS_EKS_STR_ROLE_ARN=$(circleci env subst "$AWS_EKS_STR_ROLE_ARN")
AWS_EKS_STR_CLUSTER_CONTEXT_ALIAS=$(circleci env subst "$AWS_EKS_STR_CLUSTER_CONTEXT_ALIAS")
AWS_EKS_STR_DRY_RUN=$(circleci env subst "$AWS_EKS_STR_DRY_RUN")

if [ -n "${AWS_EKS_STR_CLUSTER_NAME}" ]; then
    set -- "$@" --name "${AWS_EKS_STR_CLUSTER_NAME}"
fi
if [ -n "${AWS_EKS_STR_REGION}" ]; then
    set -- "$@" --region "${AWS_EKS_STR_REGION}"
fi
if [ -n "${AWS_EKS_STR_PROFILE}" ]; then
    set -- "$@" --profile "${AWS_EKS_STR_PROFILE}"
fi
if [ -n "${AWS_EKS_EVAL_KUBECONFIG_FILE_PATH}" ]; then
    set -- "$@" --kubeconfig "${AWS_EKS_EVAL_KUBECONFIG_FILE_PATH}"
fi
if [ -n "${AWS_EKS_STR_ROLE_ARN}" ]; then
    set -- "$@" --role-arn "${AWS_EKS_STR_ROLE_ARN}"
fi
if [ -n "${AWS_EKS_STR_CLUSTER_CONTEXT_ALIAS}" ]; then
    set -- "$@" --alias "${AWS_EKS_STR_CLUSTER_CONTEXT_ALIAS}"
fi
if [ -n "${AWS_EKS_STR_DRY_RUN}" ]; then
    set -- "$@" --dry-run "${DRY_RUN}"
fi
if [ "${AWS_EKS_INT_VERBOSE}" == "true" ]; then
    set -- "$@" --verbose
fi

aws eks update-kubeconfig "$@"
