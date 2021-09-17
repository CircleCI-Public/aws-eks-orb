#!/bin/bash
CLUSTER_NAME="<< parameters.cluster-name >>"
AWS_REGION="<< parameters.aws-region >>"
AWS_PROFILE="<< parameters.aws-profile >>"
ZONES="<< parameters.zones >>"
KUBERNETES_VERSION="<< parameters.kubernetes-version >>"
CONFIG_FILE="<< parameters.config-file >>"
VPC_PRIVATE_SUBNETS="<< parameters.vpc-private-subnets >>"
VPC_PUBLIC_SUBNETS="<< parameters.vpc-public-subnets >>"
NODEGROUP_NAME="<< parameters.nodegroup-name >>"
WITHOUT_NODEGROUP="<< parameters.without-nodegroup >>"
NODE_PRIVATE_NETWORKING="<< parameters.node-private-networking >>"
NODE_TYPE="<< parameters.node-type >>"
NODE_AMI="<< parameters.node-ami >>"
NODE_AMI_FAMILY="<< parameters.node-ami-family >>"
NODES="<< parameters.nodes >>"
NODES_MIN="<< parameters.nodes-min >>"
NODES_MAX="<< parameters.nodes-max >>"
NODE_VOLUME_SIZE="<< parameters.node-volume-size >>"
NODE_VOLUME_TYPE="<< parameters.node-volume-type >>"
MAX_PODS_PER_NODE="<< parameters.max-pods-per-node >>"
NODE_SECURITY_GROUPS="<< parameters.node-security-groups >>"
NODE_LABELS="<< parameters.node-labels >>"
NODE_ZONES="<< parameters.node-zones >>"
SSH_ACCESS="<< parameters.ssh-access >>"
SSH_PUBLIC_KEY="<< parameters.ssh-public-key >>"
ASG_ACCESS="<< parameters.asg-access >>"
EXTERNAL_DNS_ACCESS="<< parameters.external-dns-access >>"
FULL_ECR_ACCESS="<< parameters.full-ecr-access >>"
VPC_CIDR="<< parameters.vpc-cidr >>"
VPC_PRIVATE_SUBNETS="<< parameters.vpc-private-subnets >>"
VPC_PUBLIC_SUBNETS="<< parameters.vpc-public-subnets >>"
VPC_FROM_KOPS_CLUSTER="<< parameters.vpc-from-kops-cluster >>"
CFN_ROLE_ARN="<< parameters.cfn-role-arn >>"
TAGS="<< parameters.tags >>"
AWS_MAX_POLLING_WAIT_TIME="<< parameters.aws-max-polling-wait-time >>"
VERBOSE="<< parameters.verbose >>"
SHOW_EKSCTL_COMMAND="<<parameters.show-eksctl-command>>"
CLUSTER_NAME="<< parameters.cluster-name >>"
AWS_REGION="<< parameters.aws-region >>"
AWS_PROFILE="<< parameters.aws-profile >>"
VERBOSE="<< parameters.verbose >>"

if [ -n "${CLUSTER_NAME}" ]; then
    set -- "$@" --name="${CLUSTER_NAME}"
fi
if [ -n "${AWS_REGION}" ]; then
    set -- "$@" --region="${AWS_REGION}"
fi
if [ -n "${AWS_PROFILE}" ]; then
    set -- "$@" --profile="${AWS_PROFILE}"
fi
if [ -n "${ZONES}" ]; then
    set -- "$@" --zones="${ZONES}"
fi
if [ -n "${KUBERNETES_VERSION}" ]; then
    set -- "$@" --version="${KUBERNETES_VERSION}"
fi
if [ -n "${CONFIG_FILE}" ]; then
    set -- "$@" --config-file="${CONFIG_FILE}"
fi
if [ -n "${VPC_PRIVATE_SUBNETS}" ]; then
    set -- "$@" --vpc-private-subnets="${VPC_PRIVATE_SUBNETS}"
fi
if [ -n "${VPC_PUBLIC_SUBNETS}" ]; then
    set -- "$@" --vpc-public-subnets="${VPC_PUBLIC_SUBNETS}"
fi
if [ -n "${NODEGROUP_NAME}" ]; then
    set -- "$@" --nodegroup-name="${NODEGROUP_NAME}"
fi
if [ "${WITHOUT_NODEGROUP}" == "1" ]; then
    set -- "$@" --without-nodegroup
fi
if [ "${NODE_PRIVATE_NETWORKING}" == "1" ]; then
    set -- "$@" --node-private-networking
fi
if [ -n "${NODE_TYPE}" ]; then
    set -- "$@" --node-type="${NODE_TYPE}"
fi
if [ -n "${NODE_AMI}" ]; then
    set -- "$@" --node-ami="${NODE_AMI}"
fi
if [ -n "${NODE_AMI_FAMILY}" ]; then
    set -- "$@" --node-ami-family="${NODE_AMI_FAMILY}"
fi
if [ "${NODES}" != "-1" ]; then
    set -- "$@" --nodes="${NODES}"
fi
if [ "${NODES_MIN}" != "-1" ]; then
    set -- "$@" --nodes-min="${NODES_MIN}"
fi
if [ "${NODES_MAX}" != "-1" ]; then
    set -- "$@" --nodes-max="${NODES_MAX}"
fi
if [ "${NODE_VOLUME_SIZE}" != "-1" ]; then
    set -- "$@" --node-volume-size="${NODE_VOLUME_SIZE}"
fi
if [ -n "${NODE_VOLUME_TYPE}" ]; then
    set -- "$@" --node-volume-type="${NODE_VOLUME_TYPE}"
fi
if [ "${MAX_PODS_PER_NODE}" != "-1" ]; then
    set -- "$@" --max-pods-per-node="${MAX_PODS_PER_NODE}"
fi
if [ -n "${NODE_SECURITY_GROUPS}" ]; then
    set -- "$@" --node-security-groups="${NODE_SECURITY_GROUPS}"
fi
if [ -n "${NODE_LABELS}" ]; then
    set -- "$@" --node-labels="${NODE_LABELS}"
fi
if [ -n "${NODE_ZONES}" ]; then
    set -- "$@" --node-zones="${NODE_ZONES}"
fi
if [ "${SSH_ACCESS}" == "1" ]; then
    set -- "$@" --ssh-access
fi
if [ -n "${SSH_PUBLIC_KEY}" ]; then
    set -- "$@" --ssh-public-key="${SSH_PUBLIC_KEY}"
fi
if [ "${ASG_ACCESS}" == "1" ]; then
    set -- "$@" --asg-access
fi
if [ "${EXTERNAL_DNS_ACCESS}" == "1" ]; then
    set -- "$@" --external-dns-access
fi
if [ "${FULL_ECR_ACCESS}" == "1" ]; then
    set -- "$@" --full-ecr-access
fi
if [ -n "${VPC_CIDR}" ]; then
    set -- "$@" --vpc-cidr="${VPC_CIDR}"
fi
if [ -n "${VPC_PRIVATE_SUBNETS}" ]; then
    set -- "$@" --vpc-private-subnets="${VPC_PRIVATE_SUBNETS}"
fi
if [ -n "${VPC_PUBLIC_SUBNETS}" ]; then
    set -- "$@" --vpc-public-subnets="${VPC_PUBLIC_SUBNETS}"
fi
if [ -n "${VPC_FROM_KOPS_CLUSTER}" ]; then
    set -- "$@" --vpc-from-kops-cluster="${VPC_FROM_KOPS_CLUSTER}"
fi
if [ -n "${CFN_ROLE_ARN}" ]; then
    set -- "$@" --cfn-role-arn="${CFN_ROLE_ARN}"
fi
if [ -n "${AWS_MAX_POLLING_WAIT_TIME}" ]; then
    set -- "$@" --timeout="${AWS_MAX_POLLING_WAIT_TIME}"
fi
if [ -n "${TAGS}" ]; then
    set -- "$@" --tags="${TAGS}"
fi
set -- "$@" --verbose="${VERBOSE}"

if [ "${SHOW_EKSCTL_COMMAND}" == "1" ]; then
set -x
fi
eksctl create cluster "$@"
if [ ${SHOW_EKSCTL_COMMAND} == "1" ]; then
set +x
fi 
# <<# parameters.show-eksctl-command >>set -x<</ parameters.show-eksctl-command >>
# eksctl create cluster "$@"
# <<# parameters.show-eksctl-command >>set +x<</ parameters.show-eksctl-command >>

if [ -n "${CLUSTER_NAME}" ]; then
    echo Verify cluster
    if [ -n "${CLUSTER_NAME}" ]; then
    set -- "$@" --name "${CLUSTER_NAME}"
    fi
    if [ -n "${AWS_REGION}" ]; then
    set -- "$@" --region "${AWS_REGION}"
    fi
    if [ -n "${AWS_PROFILE}" ]; then
    set -- "$@" --profile="${AWS_PROFILE}"
    fi
    set -- "$@" --verbose "${VERBOSE}"

    if [ "${SHOW_EKSCTL_COMMAND}" == "1" ]; then
    set -x
    fi
    eksctl get cluster --name="${CLUSTER_NAME}" "$@"
    if [ ${SHOW_EKSCTL_COMMAND} == "1" ]; then
    set +x
    fi 
fi
