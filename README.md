# aws-custom-domain-r53

This repository is an attachment for the blog post: https://ervinszilagyi.dev/articles/expose-our-rest-api-on-aws-with-a-custom-domain.html

## Deployment

Before attempting to deploy, please make sure to set the following values:

- In the [api-gw/terraform.tf](api-gw/terraform.tf), [certificate/terraform.tf](certificate/terraform.tf) and [route53/terraform.tf](route53/terraform.tf) change the bucket name (`tf-demo-states-1234`) to your S3 bucket. This bucket is used to store the Terraform state.
- In [api-gw/variables.tf](api-gw/variables.tf) and [certificate/variables.tf](certificate/variables.tf) change the variable value for `remote_bucket` to the name of your bucket. 

1. Deploy `route53` stack:

```bash
cd route53
terraform init
terraform apply
```

2. Go to your custom domain and change the nameservers to the ones you get from the output of the `route53` stack.

**Changing nameservers can take up to 48 hours to take effect!**

You should be able to check if the change is in effect with the following command:

```bash
dig +short NS yourdomain.com
```

3. Make sure your nameserver change is in effect, otherwise the following step will fail! 
Deploy `certificate` stack:

```bash
cd certificate
terraform init
terraform apply
```

4. Deploy `api-gw`:

```bash
cd api-gw
terraform init
terraform apply
```

5. Test the REST API with the invoke url from the `api-gw` stack output:

The invoke url is a generated value, **don't use the one from the example**!!!

```bash
curl https://x4kk2j4sal.execute-api.us-east-1.amazonaws.com/dev
{
    "statusCode": 200,
    "message": "Works!"
}
```

6. If you got a successful response, you should test with the custom domain as well:

```bash
curl https://yourdomain.com
{
    "statusCode": 200,
    "message": "Works!"
}
```