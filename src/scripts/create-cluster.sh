#!/bin/bash
ORB_EVAL_CLUSTER_NAME=$(circleci env subst "$ORB_EVAL_CLUSTER_NAME")
ORB_EVAL_AWS_REGION=$(circleci env subst "$ORB_EVAL_AWS_REGION")
ORB_EVAL_AWS_PROFILE=$(circleci env subst "$ORB_EVAL_AWS_PROFILE")
ORB_EVAL_ZONES=$(circleci env subst "$ORB_EVAL_ZONES")
ORB_EVAL_KUBERNETES_VERSION=$(circleci env subst "$ORB_EVAL_KUBERNETES_VERSION")
ORB_EVAL_CONFIG_FILE=$(circleci env subst "$ORB_EVAL_CONFIG_FILE")
ORB_EVAL_VPC_PRIVATE_SUBNETS=$(circleci env subst "$ORB_EVAL_VPC_PRIVATE_SUBNETS")
ORB_EVAL_VPC_PUBLIC_SUBNETS=$(circleci env subst "$ORB_EVAL_VPC_PUBLIC_SUBNETS")
ORB_EVAL_NODEGROUP_NAME=$(circleci env subst "$ORB_EVAL_NODEGROUP_NAME")
ORB_EVAL_NODE_TYPE=$(circleci env subst "$ORB_EVAL_NODE_TYPE")
ORB_EVAL_NODE_AMI=$(circleci env subst "$ORB_EVAL_NODE_AMI")
ORB_EVAL_NODE_AMI_FAMILY=$(circleci env subst "$ORB_EVAL_NODE_AMI_FAMILY")
ORB_EVAL_NODE_VOLUME_TYPE=$(circleci env subst "$ORB_EVAL_NODE_VOLUME_TYPE")
ORB_EVAL_NODE_SECURITY_GROUPS=$(circleci env subst "$ORB_EVAL_ORB_EVAL_NODE_SECURITY_GROUPS")
ORB_EVAL_NODE_LABELS=$(circleci env subst "$ORB_EVAL_NODE_LABELS")
ORB_EVAL_NODE_ZONES=$(circleci env subst "$ORB_EVAL_NODE_ZONES")
ORB_EVAL_SSH_PUBLIC_KEY=$(circleci env subst "$ORB_EVAL_SSH_PUBLIC_KEY")
ORB_EVAL_VPC_CIDR=$(circleci env subst "$ORB_EVAL_VPC_CIDR")
ORB_EVAL_VPC_FROM_KOPS_CLUSTER=$(circleci env subst "$ORB_EVAL_VPC_FROM_KOPS_CLUSTER")
ORB_EVAL_CFN_ROLE_ARN=$(circleci env subst "$ORB_EVAL_CFN_ROLE_ARN")
ORB_EVAL_TAGS=$(circleci env subst "$ORB_EVAL_TAGS")
ORB_EVAL_AWS_MAX_POLLING_WAIT_TIME=$(circleci env subst "$ORB_EVAL_AWS_MAX_POLLING_WAIT_TIME")

if [ -n "$ORB_EVAL_CLUSTER_NAME" ]; then
    set -- "$@" --name="$ORB_EVAL_CLUSTER_NAME"
fi
if [ -n "$ORB_EVAL_AWS_REGION" ]; then
    set -- "$@" --region="$ORB_EVAL_AWS_REGION"
fi
if [ -n "$AWS_PROFILE" ]; then
    set -- "$@" --profile="$AWS_PROFILE"
fi
if [ -n "$ORB_EVAL_ZONES" ]; then
    set -- "$@" --zones="$ORB_EVAL_ZONES"
fi
if [ -n "$ORB_EVAL_KUBERNETES_VERSION" ]; then
    set -- "$@" --version="$ORB_EVAL_KUBERNETES_VERSION"
fi
if [ -n "$ORB_EVAL_CONFIG_FILE" ]; then
    set -- "$@" --config-file="$ORB_EVAL_CONFIG_FILE"
fi
if [ -n "$ORB_EVAL_VPC_PRIVATE_SUBNETS" ]; then
    set -- "$@" --vpc-private-subnets="$ORB_EVAL_VPC_PRIVATE_SUBNETS"
fi
if [ -n "$ORB_EVAL_VPC_PUBLIC_SUBNETS" ]; then
    set -- "$@" --vpc-public-subnets="$ORB_EVAL_VPC_PUBLIC_SUBNETS"
fi
if [ -n "$ORB_EVAL_NODEGROUP_NAME" ]; then
    set -- "$@" --nodegroup-name="$ORB_EVAL_NODEGROUP_NAME"
fi
if [ "$ORB_VAL_WITHOUT_NODEGROUP" == "1" ]; then
    set -- "$@" --without-nodegroup
fi
if [ "$ORB_VAL_NODE_PRIVATE_NETWORKING" == "1" ]; then
    set -- "$@" --node-private-networking
fi
if [ -n "$ORB_EVAL_NODE_TYPE" ]; then
    set -- "$@" --node-type="$ORB_EVAL_NODE_TYPE"
fi
if [ -n "$ORB_EVAL_NODE_AMI" ]; then
    set -- "$@" --node-ami="$ORB_EVAL_NODE_AMI"
fi
if [ -n "$ORB_EVAL_NODE_AMI_FAMILY" ]; then
    set -- "$@" --node-ami-family="$ORB_EVAL_NODE_AMI_FAMILY"
fi
if [ "$ORB_VAL_NODES" != "-1" ]; then
    set -- "$@" --nodes="$ORB_VAL_NODES"
fi
if [ "$ORB_VAL_NODES_MIN" != "-1" ]; then
    set -- "$@" --nodes-min="$ORB_VAL_NODES_MIN"
fi
if [ "$ORB_VAL_NODES_MAX" != "-1" ]; then
    set -- "$@" --nodes-max="$ORB_VAL_NODES_MAX"
fi
if [ "$ORB_VAL_NODE_VOLUME_SIZE" != "-1" ]; then
    set -- "$@" --node-volume-size="$ORB_VAL_NODE_VOLUME_SIZE"
fi
if [ -n "$ORB_EVAL_NODE_VOLUME_TYPE" ]; then
    set -- "$@" --node-volume-type="$ORB_EVAL_NODE_VOLUME_TYPE"
fi
if [ "$ORB_VAL_MAX_PODS_PER_NODE" != "-1" ]; then
    set -- "$@" --max-pods-per-node="$ORB_VAL_MAX_PODS_PER_NODE"
fi
if [ -n "$ORB_EVAL_ORB_EVAL_NODE_SECURITY_GROUPS" ]; then
    set -- "$@" --node-security-groups="$ORB_EVAL_NODE_SECURITY_GROUPS"
fi
if [ -n "$ORB_EVAL_NODE_LABELS" ]; then
    set -- "$@" --node-labels="$ORB_EVAL_NODE_LABELS"
fi
if [ -n "$ORB_EVAL_NODE_ZONES" ]; then
    set -- "$@" --node-zones="$ORB_EVAL_NODE_ZONES"
fi
if [ "$ORB_VAL_SSH_ACCESS" == "1" ]; then
    set -- "$@" --ssh-access
fi
if [ -n "$ORB_EVAL_SSH_PUBLIC_KEY" ]; then
    set -- "$@" --ssh-public-key="$ORB_EVAL_SSH_PUBLIC_KEY"
fi
if [ "$ORB_VAL_ASG_ACCESS" == "1" ]; then
    set -- "$@" --asg-access
fi
if [ "$ORB_VAL_EXTERNAL_DNS_ACCESS" == "1" ]; then
    set -- "$@" --external-dns-access
fi
if [ "$ORB_VAL_FULL_ECR_ACCESS" == "1" ]; then
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
set -- "$@" --verbose="$ORB_VAL_VERBOSE"
if [ "$ORB_VAL_FARGATE" == "1" ]; then
    set -- "$@" --fargate
fi
if [ "$ORB_VAL_SHOW_EKSCTL_COMMAND" == "1" ]; then
    set -x
fi

eksctl create cluster "$@"

if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
    set +x
fi

if [ -n "$ORB_EVAL_CLUSTER_NAME" ]; then
    echo Verify cluster
    if [ -n "$ORB_EVAL_CLUSTER_NAME" ]; then
        set -- "$@" --name "$ORB_EVAL_CLUSTER_NAME"
    fi
    if [ -n "$ORB_EVAL_AWS_REGION" ]; then
        set -- "$@" --region "$ORB_EVAL_AWS_REGION"
        echo "$ORB_EVAL_AWS_REGION"
    fi
    if [ -n "$AWS_PROFILE" ]; then
        set -- "$@" --profile="$AWS_PROFILE"
    fi
    set -- "$@" --verbose "$VERBOSE"

    if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
        set -x
    fi
    eksctl get cluster --name="$ORB_EVAL_CLUSTER_NAME" --region="$ORB_EVAL_AWS_REGION"
    if [ "$SHOW_EKSCTL_COMMAND" == "1" ]; then
        set +x
    fi
fi
