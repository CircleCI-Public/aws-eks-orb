# AWS EKS Orb [![CircleCI status](https://circleci.com/gh/CircleCI-Public/aws-eks-orb.svg "CircleCI status")](https://circleci.com/gh/CircleCI-Public/aws-eks-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/circleci/aws-eks)](https://circleci.com/orbs/registry/orb/circleci/aws-eks) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/circleci-public/aws-eks-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

A CircleCI Orb to simplify deployments to Amazon Elastic Container Service for Kubernetes (Amazon EKS).

Here are some features that the AWS EKS orb provides:

- Setting up and tearing down of EKS clusters via the `create-cluster` and `delete-cluster` commands / jobs
- Allowing `kubectl` and other tools that access `kubeconfig` (like `helm`) to work with an EKS cluster via the `update-kubeconfig-with-authenticator` command
- Updating deployments with container image updates via the `update-container-image` job
- Installing helm and helm charts (See: `install-helm-on-cluster` and `install-helm-chart`)

## Usage

See the [orb registry listing](http://circleci.com/orbs/registry/orb/circleci/aws-eks) for usage guidelines.

## Requirements

- AWS credential information should be accessible to the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html). The easiest way to provide the information would be to configure [`AWS_ACCESS_KEY_ID`](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html), [`AWS_SECRET_ACCESS_KEY`](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) and [`AWS_DEFAULT_REGION`](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) as CircleCI [project](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project) or [context](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-context) environment variables.

- `curl` should be present in `PATH`.

- A `python` installation present in `PATH` that supports running the AWS CLI

- `pip` if the AWS CLI needs to be installed

## Examples

Full usage examples can be found on the AWS EKS orb's page in the orb registry, [here](https://circleci.com/orbs/registry/orb/circleci/aws-eks#usage-examples).

A demo project is also available [here](https://github.com/CircleCI-Public/circleci-demo-aws-eks).

```
version: 2.1

orbs:
  aws-eks: circleci/aws-eks@x.y
  kubernetes: circleci/kubernetes@0.4.0

jobs:
  create-deployment:
    executor: aws-eks/python3
    parameters:
      cluster-name:
        description: |
          Name of the EKS cluster
        type: string
    steps:
      - checkout
      - aws-eks/update-kubeconfig-with-authenticator:
          cluster-name: << parameters.cluster-name >>
          install-kubectl: true
      - kubernetes/create-or-update-resource:
          resource-file-path: "tests/nginx-deployment/deployment.yaml"
          resource-name: "deployment/nginx-deployment"
          get-rollout-status: true
          show-kubectl-command: true

workflows:
  deployment:
    jobs:
      - aws-eks/create-cluster:
          cluster-name: eks-demo-deployment
      - create-deployment:
          cluster-name: eks-demo-deployment
          requires:
            - aws-eks/create-cluster
      - aws-eks/update-container-image:
          cluster-name: eks-demo-deployment
          resource-name: "deployment/nginx-deployment"
          container-image-updates: "nginx=nginx:1.9.1"
          record: true
          requires:
            - create-deployment
      - aws-eks/delete-cluster:
          cluster-name: eks-demo-deployment
          requires:
              - aws-eks/update-container-image
```


## Contributing

We welcome [issues](https://github.com/CircleCI-Public/aws-eks-orb/issues) to and [pull requests](https://github.com/CircleCI-Public/aws-eks-orb/pulls) against this repository!

For further questions/comments about this or other orbs, visit [CircleCI's orbs discussion forum](https://discuss.circleci.com/c/orbs).
