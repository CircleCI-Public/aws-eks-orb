# Notes for Internal Contributors

The notes here are primarily targeted at internal (CircleCI) contributors to the orb but could be of reference to fork owners who wish to run the tests with their own AWS account.

## Building

### Required Project Environment Variables

The following [environment variables](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project) must be set for the project on CircleCI via the project settings page, before the project can be built successfully.

| Variable                       | Description                      |
| -------------------------------| ---------------------------------|
| `AWS_ACCESS_KEY_ID`            | Picked up by the AWS CLI              |
| `AWS_SECRET_ACCESS_KEY`        | Picked up by the AWS CLI              |
| `AWS_DEFAULT_REGION`           | Picked up by the AWS CLI              |
| `AWS_RESOURCE_NAME_PREFIX`     | Prefix for some AWS resources created in tests. This is used just to make the project more portable.                |
| `CIRCLECI_API_KEY`             | Used by the `queue` orb          |
| `CIRCLE_TOKEN`                 | Used to publish the orb          |
| `SKIP_TEST_ENV_CREATION`       | Set this to true when you want to skip EKS cluster creation to facilitate testing |
| `SKIP_TEST_ENV_TEARDOWN`       | Set this to true when you want to skip EKS cluster teardown to facilitate testing |

### AWS Resource Cleanup

The tests configured in `.circleci/config.yml` have been tested to be able to successfully clean up the AWS resources used, via the `delete-cluster` command. 

However, when adding new tests, depending on the type of AWS resources involved (e.g. AWS Elastic Load Balancers), you may encounter situations where if the resources deployed onto the EKS cluster are not deleted before running `delete-cluster`, `delete-cluster` may fail to remove all of the deployed AWS resources, e.g. the VPC.

When that happens, in order to properly clean up the AWS resources, first check on the status of the CloudFormation stack corresponding to the EKS cluster used in the test. If the status is `DELETE_FAILED`, check the events for a hint of which AWS resources could not be deleted. Usually it is a Load Balancer that is preventing the VPC (that was created by `create-cluster`) from being deleted. Once that resource has been deleted, you should be able to delete the entire VPC from the `VPC` section of the AWS Console.
