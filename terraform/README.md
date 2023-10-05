Define and Deploy AWS S3 bucket related resources using Terraform for S3 Static Website Hosting.

Run below commands to deploy Terraform resources to AWS. You must have AWS profile `app-deployer` configured in your local machine.

```bash
export AWS_PROFILE=app-deployer

make plan

make apply
```

After created, run `hugo deploy` in project root directory to upload static documents under `/public` to S3 bucket. The deployment configuration is setup in `hugo.toml` as below.

```toml
# Upload the static website docs into S3 bucket
[deployment]
[[deployment.targets]]
name = "aws"
URL = "s3://{Your_bucket_name}"
```