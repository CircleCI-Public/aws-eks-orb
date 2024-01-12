#!/bin/bash
AWS_EKS_STR_CLUSTER_NAME="$(echo "${AWS_EKS_STR_CLUSTER_NAME}" | circleci env subst)"
AWS_EKS_STR_REGION="$(echo "${AWS_EKS_STR_REGION}" | circleci env subst)"
AWS_EKS_STR_PROFILE="$(echo "${AWS_EKS_STR_PROFILE}" | circleci env subst)"
AWS_EKS_STR_ZONES="$(echo "${AWS_EKS_STR_ZONES}" | circleci env subst)"
AWS_EKS_STR_ORB_KUBERNETES_VERSION="$(echo "${AWS_EKS_STR_ORB_KUBERNETES_VERSION}" | circleci env subst)"
AWS_EKS_STR_CONFIG_FILE="$(echo "${AWS_EKS_STR_CONFIG_FILE}" | circleci env subst)"
AWS_EKS_STR_NODEGROUP_NAME="$(echo "${AWS_EKS_STR_NODEGROUP_NAME}" | circleci env subst)"
AWS_EKS_STR_VPC_PRIVATE_SUBNETS="$(echo "${AWS_EKS_STR_VPC_PRIVATE_SUBNETS}" | circleci env subst)"
AWS_EKS_STR_VPC_PUBLIC_SUBNETS="$(echo "${AWS_EKS_STR_VPC_PUBLIC_SUBNETS}" | circleci env subst)"
AWS_EKS_STR_NODE_TYPE="$(echo "${AWS_EKS_STR_NODE_TYPE}" | circleci env subst)"
AWS_EKS_STR_NODE_AMI="$(echo "${AWS_EKS_STR_NODE_AMI}" | circleci env subst)"
AWS_EKS_STR_NODE_AMI_FAMILY="$(echo "${AWS_EKS_STR_NODE_AMI_FAMILY}" | circleci env subst)"
AWS_EKS_STR_NODE_VOLUME_TYPE="$(echo "${AWS_EKS_STR_NODE_VOLUME_TYPE}" | circleci env subst)"
AWS_EKS_STR_NODE_SECURITY_GROUPS="$(echo "${AWS_EKS_STR_NODE_SECURITY_GROUPS}" | circleci env subst)"
AWS_EKS_STR_NODE_LABELS="$(echo "${AWS_EKS_STR_NODE_LABELS}" | circleci env subst)"
AWS_EKS_STR_NODE_ZONES="$(echo "${AWS_EKS_STR_NODE_ZONES}" | circleci env subst)"
AWS_EKS_STR_SSH_PUBLIC_KEY="$(echo "${AWS_EKS_STR_SSH_PUBLIC_KEY}" | circleci env subst)"
AWS_EKS_STR_VPC_CIDR="$(echo "${AWS_EKS_STR_VPC_CIDR}" | circleci env subst)"
AWS_EKS_STR_FROM_KOPS_CLUSTER="$(echo "${AWS_EKS_STR_FROM_KOPS_CLUSTER}" | circleci env subst)"
AWS_EKS_STR_CFN_ROLE_ARN="$(echo "${AWS_EKS_STR_CFN_ROLE_ARN}" | circleci env subst)"
AWS_EKS_STR_TAGS="$(echo "${AWS_EKS_STR_TAGS}" | circleci env subst)"
AWS_EKS_STR_MAX_POLLING_WAIT_TIME="$(echo "${AWS_EKS_STR_MAX_POLLING_WAIT_TIME}" | circleci env subst)"

if [ -n "$AWS_EKS_STR_CLUSTER_NAME" ]; then
    set -- "$@" --name="$AWS_EKS_STR_CLUSTER_NAME"
fi
if [ -n "$AWS_EKS_STR_REGION" ]; then
    set -- "$@" --region="$AWS_EKS_STR_REGION"
fi
if [ -n "$AWS_PROFILE" ]; then
    set -- "$@" --profile="$AWS_PROFILE"
fi
if [ -n "$AWS_EKS_STR_ZONES" ]; then
    set -- "$@" --zones="$AWS_EKS_STR_ZONES"
fi
if [ -n "$AWS_EKS_STR_ORB_KUBERNETES_VERSION" ]; then
    set -- "$@" --version="$AWS_EKS_STR_ORB_KUBERNETES_VERSION"
fi
if [ -n "$AWS_EKS_STR_CONFIG_FILE" ]; then
    set -- "$@" --config-file="$AWS_EKS_STR_CONFIG_FILE"
fi
if [ -n "$AWS_EKS_STR_VPC_PRIVATE_SUBNETS" ]; then
    set -- "$@" --vpc-private-subnets="$AWS_EKS_STR_VPC_PRIVATE_SUBNETS"
fi
if [ -n "$AWS_EKS_STR_VPC_PUBLIC_SUBNETS" ]; then
    set -- "$@" --vpc-public-subnets="$AWS_EKS_STR_VPC_PUBLIC_SUBNETS"
fi
if [ -n "$AWS_EKS_STR_NODEGROUP_NAME" ]; then
    set -- "$@" --nodegroup-name="$AWS_EKS_STR_NODEGROUP_NAME"
fi
if [ "$AWS_EKS_BOOL_WITHOUT_NODEGROUP" == "1" ]; then
    set -- "$@" --without-nodegroup
fi
if [ "$AWS_EKS_BOOL_NODE_PRIVATE_NETWORKING" == "1" ]; then
    set -- "$@" --node-private-networking
fi
if [ -n "$AWS_EKS_STR_NODE_TYPE" ]; then
    set -- "$@" --node-type="$AWS_EKS_STR_NODE_TYPE"
fi
if [ -n "$AWS_EKS_STR_NODE_AMI" ]; then
    set -- "$@" --node-ami="$AWS_EKS_STR_NODE_AMI"
fi
if [ -n "$AWS_EKS_STR_NODE_AMI_FAMILY" ]; then
    set -- "$@" --node-ami-family="$AWS_EKS_STR_NODE_AMI_FAMILY"
fi
if [ "$AWS_EKS_INT_NODES" != "-1" ]; then
    set -- "$@" --nodes="$AWS_EKS_INT_NODES"
fi
if [ "$AWS_EKS_INT_NODES_MIN" != "-1" ]; then
    set -- "$@" --nodes-min="$AWS_EKS_INT_NODES_MIN"
fi
if [ "$AWS_EKS_INT_NODES_MAX" != "-1" ]; then
    set -- "$@" --nodes-max="$AWS_EKS_INT_NODES_MAX"
fi
if [ "$AWS_EKS_INT_NODE_VOLUME_SIZE" != "-1" ]; then
    set -- "$@" --node-volume-size="$AWS_EKS_INT_NODE_VOLUME_SIZE"
fi
if [ -n "$AWS_EKS_STR_NODE_VOLUME_TYPE" ]; then
    set -- "$@" --node-volume-type="$AWS_EKS_STR_NODE_VOLUME_TYPE"
fi
if [ "$AWS_EKS_INT_MAX_PODS_PER_NODE" != "-1" ]; then
    set -- "$@" --max-pods-per-node="$AWS_EKS_INT_MAX_PODS_PER_NODE"
fi
if [ -n "$AWS_EKS_STR_NODE_SECURITY_GROUPS" ]; then
    set -- "$@" --node-security-groups="$AWS_EKS_STR_NODE_SECURITY_GROUPS"
fi
if [ -n "$AWS_EKS_STR_NODE_LABELS" ]; then
    set -- "$@" --node-labels="$AWS_EKS_STR_NODE_LABELS"
fi
if [ -n "$AWS_EKS_STR_NODE_ZONES" ]; then
    set -- "$@" --node-zones="$AWS_EKS_STR_NODE_ZONES"
fi
if [ "$AWS_EKS_BOOL_SSH_ACCESS" == "1" ]; then
    set -- "$@" --ssh-access
fi
if [ -n "$AWS_EKS_STR_SSH_PUBLIC_KEY" ]; then
    set -- "$@" --ssh-public-key="$AWS_EKS_STR_SSH_PUBLIC_KEY"
fi
if [ "$AWS_EKS_BOOL_ASG_ACCESS" == "1" ]; then
    set -- "$@" --asg-access
fi
if [ "$AWS_EKS_BOOL_EXTERNAL_DNS_ACCESS" == "1" ]; then
    set -- "$@" --external-dns-access
fi
if [ "$AWS_EKS_BOOL_FULL_ECR_ACCESS" == "1" ]; then
    set -- "$@" --full-ecr-access
fi
if [ -n "$VPC_CIDR" ]; then
    set -- "$@" --vpc-cidr="$VPC_CIDR"
fi
if [ -n "$VPC_FROM_KOPS_CLUSTER" ]; then
    set -- "$@" --vpc-from-kops-cluster="$VPC_FROM_KOPS_CLUSTER"
fi
if [ -n "$CFN_ROLE_ARN" ]; then
    set -- "$@" --cfn-role-arn="$CFN_ROLE_ARN"
fi
if [ -n "$AWS_MAX_POLLING_WAIT_TIME" ]; then
    set -- "$@" --timeout="$AWS_MAX_POLLING_WAIT_TIME"
fi
if [ -n "$TAGS" ]; then
    set -- "$@" --tags="$TAGS"
fi
set -- "$@" --verbose="$AWS_EKS_INT_VERBOSE"
if [ "$AWS_EKS_BOOL_FARGATE" == "1" ]; then
    set -- "$@" --fargate
fi
if [ "$AWS_EKS_BOOL_EKSCTL_COMMAND" == "1" ]; then
    set -x
fi

eksctl create cluster "$@"

if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
    set +x
fi

if [ -n "$AWS_EKS_STR_CLUSTER_NAME" ]; then
    echo Verify cluster
    if [ -n "$AWS_EKS_STR_CLUSTER_NAME" ]; then
        set -- "$@" --name "$AWS_EKS_STR_CLUSTER_NAME"
    fi
    if [ -n "$AWS_EKS_STR_REGION" ]; then
        set -- "$@" --region "$AWS_EKS_STR_REGION"
        echo "$AWS_EKS_STR_REGION"
    fi
    if [ -n "$AWS_PROFILE" ]; then
        set -- "$@" --profile="$AWS_PROFILE"
    fi
    set -- "$@" --verbose "$VERBOSE"

    if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
        set -x
    fi
    eksctl get cluster --name="$AWS_EKS_STR_CLUSTER_NAME" --region="$AWS_EKS_STR_REGION"
    if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
        set +x
    fi
fi