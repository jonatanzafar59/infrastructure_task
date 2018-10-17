<u><h3> tools:</h3></u>
* terraform
* terragrunt (Well known open source warpper for Terraform)

<u><h3> General approach:</h3></u>
* Create 2 groups - jnr_dev, snr_dev.
* Attach relevant policy for each group.
* On user creation, the group membership can be specified.
* Directory structure the best practice, recommanded by Terragrunt.

<u><h3> Why only terraform?:</h3></u>
* every component should have state (user, group, s3bucket etc.), thus Ansible isn't sutible for the job.
* We can control user creation & deletion simply by running terragrunt apply/destroy.
* Reusable code

<u><h3> How to handle the state?:</h3></u>
* The state is saved to s3, in a bucket called 'neu-automat-terraform-state' in region 'eu-west-1'. 
* defined in environments/neu-automat-prod/terraform.tfvars
* When you first run 'terragrunt apply', it will ask you if you want it to create the bucket of the state for you, so don't worry about creating it.

<u><h3> Where are the AWS Credentials for Terraform stored? </u></h3>
 * environment variables:
    * AWS_SECRET_ACCESS_KEY
    * AWS_ACCESS_KEY_ID

<u>The variables for each environment stored in 'environments/ENV/terraform.tfvars'</u>

<u><h3>Setup:</u></h3>
```
# create s3 bucket
$ cd environments/neu-automat-prod/s3-buckets
$ terragrunt apply
# create groups
$ cd environments/iam/groups/jnr_dev
$ terragrunt apply
$ cd environments/iam/groups/snr_dev
$ terragrunt apply
# create users
$ cd environments/iam/users/jnr1
$ terragrunt apply 
```