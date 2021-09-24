#!/bin/bash
CLUSTER_NAME=$(eval echo "$PARAM_CLUSTER_NAME")
AWS_REGION=$(eval echo "$PARAM_AWS_REGION")
AWS_PROFILE=$(eval echo "$PARAM_AWS_PROFILE")
ZONES=$(eval echo "$PARAM_ZONES")
KUBERNETES_VERSION=$(eval echo "$PARAM_KUBERNETES_VERSION")
CONFIG_FILE=$(eval echo "$PARAM_CONFIG_FILE")
VPC_PRIVATE_SUBNETS=$(eval echo "$PARAM_VPC_PRIVATE_SUBNETS")
VPC_PUBLIC_SUBNETS=$(eval echo "$PARAM_VPC_PUBLIC_SUBNETS")
NODEGROUP_NAME=$(eval echo "$PARAM_NODEGROUP_NAME")
WITHOUT_NODEGROUP=$(eval echo "$PARAM_WITHOUT_NODEGROUP")
NODE_PRIVATE_NETWORKING=$(eval echo "$PARAM_NODE_PRIVATE_NETWORKING")
NODE_TYPE=$(eval echo "$PARAM_NODE_TYPE")
NODE_AMI=$(eval echo "$PARAM_NODE_AMI")
NODE_AMI_FAMILY=$(eval echo "$PARAM_NODE_AMI_FAMILY")
NODES=$(eval echo "$PARAM_NODES")
NODES_MIN=$(eval echo "$PARAM_NODES_MIN")
NODES_MAX=$(eval echo "$PARAM_NODES_MAX")
NODE_VOLUME_SIZE=$(eval echo "$PARAM_NODE_VOLUME_SIZE")
NODE_VOLUME_TYPE=$(eval echo "$PARAM_NODE_VOLUME_TYPE")
MAX_PODS_PER_NODE=$(eval echo "$PARAM_MAX_PODS_PER_NODE")
NODE_SECURITY_GROUPS=$(eval echo "$PARAM_NODE_SECURITY_GROUPS")
NODE_LABELS=$(eval echo "$PARAM_NODE_LABELS")
NODE_ZONES=$(eval echo "$PARAM_NODE_ZONES")
SSH_ACCESS=$(eval echo "$PARAM_SSH_ACCESS")
SSH_PUBLIC_KEY=$(eval echo "$PARAM_SSH_PUBLIC_KEY")
ASG_ACCESS=$(eval echo "$PARAM_ASG_ACCESS")
EXTERNAL_DNS_ACCESS=$(eval echo "$PARAM_EXTERNAL_DNS_ACCESS")
FULL_ECR_ACCESS=$(eval echo "$PARAM_FULL_ECR_ACCESS")
VPC_CIDR=$(eval echo "$PARAM_VPC_CIDR")
VPC_PRIVATE_SUBNETS=$(eval echo "$PARAM_VPC_PRIVATE_SUBNETS")
VPC_PUBLIC_SUBNETS=$(eval echo "$PARAM_VPC_PUBLIC_SUBNETS")
VPC_FROM_KOPS_CLUSTER=$(eval echo "$PARAM_VPC_FROM_KOPS_CLUSTER")
CFN_ROLE_ARN=$(eval echo "$PARAM_CFN_ROLE_ARN")
TAGS=$(eval echo "$PARAM_TAGS")
AWS_MAX_POLLING_WAIT_TIME=$(eval echo "$PARAM_AWS_MAX_POLLING_WAIT_TIM")
VERBOSE=$(eval echo "$PARAM_VERBOSE")
SHOW_EKSCTL_COMMAND=$(eval echo "$PARAM_SHOW_EKSCTL_COMMAND")


if [ -n "$CLUSTER_NAME" ]; then
    set -- "$@" --name="$CLUSTER_NAME"
    echo "$@"
fi
if [ -n "${!AWS_REGION}" ]; then
    set -- "$@" --region="${!AWS_REGION}"
fi
if [ -n "${!AWS_PROFILE}" ]; then
    set -- "$@" --profile="${!AWS_PROFILE}"
fi
if [ -n "${!ZONES}" ]; then
    set -- "$@" --zones="${!ZONES}"
fi
if [ -n "${!KUBERNETES_VERSION}" ]; then
    set -- "$@" --version="${!KUBERNETES_VERSION}"
fi
if [ -n "${!CONFIG_FILE}" ]; then
    set -- "$@" --config-file="${!CONFIG_FILE}"
fi
if [ -n "${!VPC_PRIVATE_SUBNETS}" ]; then
    set -- "$@" --vpc-private-subnets="${!VPC_PRIVATE_SUBNETS}"
fi
if [ -n "${!VPC_PUBLIC_SUBNETS}" ]; then
    set -- "$@" --vpc-public-subnets="${!VPC_PUBLIC_SUBNETS}"
fi
if [ -n "${!NODEGROUP_NAME}" ]; then
    set -- "$@" --nodegroup-name="${!NODEGROUP_NAME}"
fi
if [ "${!WITHOUT_NODEGROUP}" == "1" ]; then
    set -- "$@" --without-nodegroup
fi
if [ "${!NODE_PRIVATE_NETWORKING}" == "1" ]; then
    set -- "$@" --node-private-networking
fi
if [ -n "${!NODE_TYPE}" ]; then
    set -- "$@" --node-type="${!NODE_TYPE}"
fi
if [ -n "${!NODE_AMI}" ]; then
    set -- "$@" --node-ami="${!NODE_AMI}"
fi
if [ -n "${!NODE_AMI_FAMILY}" ]; then
    set -- "$@" --node-ami-family="${!NODE_AMI_FAMILY}"
fi
if [ "${!NODES}" != "-1" ]; then
    set -- "$@" --nodes="${!NODES}"
fi
if [ "${!NODES_MIN}" != "-1" ]; then
    set -- "$@" --nodes-min="${!NODES_MIN}"
fi
if [ "${!NODES_MAX}" != "-1" ]; then
    set -- "$@" --nodes-max="${!NODES_MAX}"
fi
if [ "${!NODE_VOLUME_SIZE}" != "-1" ]; then
    set -- "$@" --node-volume-size="${!NODE_VOLUME_SIZE}"
fi
if [ -n "${!NODE_VOLUME_TYPE}" ]; then
    set -- "$@" --node-volume-type="${!NODE_VOLUME_TYPE}"
fi
if [ "${!MAX_PODS_PER_NODE}" != "-1" ]; then
    set -- "$@" --max-pods-per-node="${!MAX_PODS_PER_NODE}"
fi
if [ -n "${!NODE_SECURITY_GROUPS}" ]; then
    set -- "$@" --node-security-groups="${!NODE_SECURITY_GROUPS}"
fi
if [ -n "${!NODE_LABELS}" ]; then
    set -- "$@" --node-labels="${!NODE_LABELS}"
fi
if [ -n "${!NODE_ZONES}" ]; then
    set -- "$@" --node-zones="${!NODE_ZONES}"
fi
if [ "${!SSH_ACCESS}" == "1" ]; then
    set -- "$@" --ssh-access
fi
if [ -n "${!SSH_PUBLIC_KEY}" ]; then
    set -- "$@" --ssh-public-key="${!SSH_PUBLIC_KEY}"
fi
if [ "${!ASG_ACCESS}" == "1" ]; then
    set -- "$@" --asg-access
fi
if [ "${!EXTERNAL_DNS_ACCESS}" == "1" ]; then
    set -- "$@" --external-dns-access
fi
if [ "${!FULL_ECR_ACCESS}" == "1" ]; then
    set -- "$@" --full-ecr-access
fi
if [ -n "${!VPC_CIDR}" ]; then
    set -- "$@" --vpc-cidr="${!VPC_CIDR}"
fi
if [ -n "${!VPC_PRIVATE_SUBNETS}" ]; then
    set -- "$@" --vpc-private-subnets="${!VPC_PRIVATE_SUBNETS}"
fi
if [ -n "${!VPC_PUBLIC_SUBNETS}" ]; then
    set -- "$@" --vpc-public-subnets="${!VPC_PUBLIC_SUBNETS}"
fi
if [ -n "${!VPC_FROM_KOPS_CLUSTER}" ]; then
    set -- "$@" --vpc-from-kops-cluster="${!VPC_FROM_KOPS_CLUSTER}"
fi
if [ -n "${!CFN_ROLE_ARN}" ]; then
    set -- "$@" --cfn-role-arn="${!CFN_ROLE_ARN}"
fi
if [ -n "${!AWS_MAX_POLLING_WAIT_TIME}" ]; then
    set -- "$@" --timeout="${!AWS_MAX_POLLING_WAIT_TIME}"
fi
if [ -n "${!TAGS}" ]; then
    set -- "$@" --tags="${!TAGS}"
fi
set -- "$@" --verbose="${!VERBOSE}"

if [ "${!SHOW_EKSCTL_COMMAND}" == "1" ]; then
    set -x
fi

eksctl create cluster "$@"

if [ "${!SHOW_EKSCTL_COMMAND}" == "1" ]; then
    set +x
fi
# <<# PARAM_.show-eksctl-command >>set -x<</ PARAM_.show-eksctl-command >>
# eksctl create cluster "$@"
# <<# PARAM_.show-eksctl-command >>set +x<</ PARAM_.show-eksctl-command >>

if [ -n "${!CLUSTER_NAME}" ]; then
    echo Verify cluster
    if [ -n "${!CLUSTER_NAME}" ]; then
        set -- "$@" --name "${!CLUSTER_NAME}"
    fi
    if [ -n "${!AWS_REGION}" ]; then
        set -- "$@" --region "${!AWS_REGION}"
    fi
    if [ -n "${!AWS_PROFILE}" ]; then
        set -- "$@" --profile="${!AWS_PROFILE}"
    fi
    set -- "$@" --verbose "${!VERBOSE}"

    if [ "${!SHOW_EKSCTL_COMMAND}" == "1" ]; then
        set -x
    fi
    eksctl get cluster --name="${!CLUSTER_NAME}" "$@"
    if [ "${!SHOW_EKSCTL_COMMAND}" == "1" ]; then
        set +x
    fi
fi
