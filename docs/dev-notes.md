# Notes for Internal Contributors

The notes here are primarily targeted at internal (CircleCI) contributors to the orb but could be of reference to fork owners who wish to run the tests with their own AWS account.

## Building

### Required Project Environment Variables

The following [project environment variables](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project) must be set for the project on CircleCI via the project settings page, before the project can be built successfully.

| Variable                       | Description                      |
| -------------------------------| ---------------------------------|
| `AWS_ACCESS_KEY_ID`            | Picked up by the AWS CLI              |
| `AWS_SECRET_ACCESS_KEY`        | Picked up by the AWS CLI              |
| `AWS_DEFAULT_REGION`           | Picked up by the AWS CLI              |
| `AWS_RESOURCE_NAME_PREFIX`     | Prefix for some AWS resources created in tests. This is used just to make the project more portable.                |
| `CIRCLECI_API_KEY`             | Used by the `queue` orb          |
| `SKIP_TEST_ENV_CREATION`       | Set this to true when you want to skip EKS cluster creation to facilitate testing. The `test-ssh-access` job will be skipped when this is enabled. Note: This env var is only effective for the clusters that are created via `aws-eks` orb commands and not `aws-eks` orb jobs. |
| `SKIP_TEST_ENV_TEARDOWN`       | Set this to true when you want to skip EKS cluster teardown to facilitate testing. Note: this is only effective for the clusters that are created via `aws-eks` orb commands and not `aws-eks` orb jobs. |

### Required Context and Context Environment Variables

The `orb-publishing` context is referenced in the build. In particular, the following [context environment variables](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-context) must be set in the `orb-publishing` context, before the project can be built successfully.

| Variable                       | Description                      |
| -------------------------------| ---------------------------------|
| `CIRCLE_TOKEN`                 | CircleCI API token used to publish the orb  |


### AWS Resource Cleanup

The tests configured in `.circleci/config.yml` have been tested to be able to successfully clean up the AWS resources used, via the `delete-cluster` command. 

However, when adding new tests, depending on the type of AWS resources involved (e.g. AWS Elastic Load Balancers), you may encounter situations where if the resources deployed onto the EKS cluster are not deleted before running `delete-cluster`, `delete-cluster` may fail to remove all of the deployed AWS resources, e.g. the VPC.

When that happens, in order to properly clean up the AWS resources, first try to delete the CloudFormation stacks (there are 2 for each deployed cluster - one that has `nodegroup` in its name and one that ends with the `-cluster` suffix) by deleting the nodegroup stack first and then the the other stack, for each cluster and region under test.

If a CloudFormation stack cannot be deleted, check on the status of the CloudFormation stack corresponding to the EKS cluster used in the test. If the status is `DELETE_FAILED`, check the events for a hint of which AWS resources could not be deleted. Usually it is a Load Balancer that is preventing the VPC (that was created by `create-cluster`) from being deleted. Once that resource has been deleted, you should be able to delete the entire VPC from the `VPC` section of the AWS Console.

## Orb Publishing
The orb is promoted into publishing by triggering the `production-orb-publishing` workflow. This workflow is meant to be manually triggered by tagging a `master` branch commit, after (manually) verifying that it has successfully completed the `integration-tests` workflow. The `production-orb-publishing` workflow will promote into production a dev orb that was published with a version that corresponds to the shortened SHA-1 hash of the tagged commit. The workflow has a manual approval step before it can proceed to promotion of the orb.

### Patch release tag example:

```
git tag patch-release-v0.0.1
git push origin patch-release-v0.0.1
```

### Minor release tag example:

```
git tag minor-release-v0.1.0
git push origin minor-release-v0.1.0
```

### Major release tag example:

```
git tag major-release-v1.0.0
git push origin major-release-v1.0.0
```
