setup() {
    rm -rf "$(which aws-iam-authenticator)"
}

teardown() {
    rm -rf "$(which aws-iam-authenticator)"
}

@test "Installs IAM-Authenticator" {
    . ./src/scripts/install-aws-iam-authenticator.sh
    command -v aws-iam-authenticator
}
