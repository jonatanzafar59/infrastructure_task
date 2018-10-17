data "terraform_remote_state" "state1" {
  backend = "s3"
  config {
    bucket     = "neu-automat-terraform-state"
    key        = "${var.environment}/vpc/terraform.tfstate"
    region     = "eu-west-1"
    profile    = "neu-automat"
  }
}

data "template_file" "policy" {
  template      = "${file("${path.module}/policy.json")}"
  vars = {
    environment  = "${lower(var.environment)}"
  }
}

module "main" {
  source      	               = "../../../../core/iam/groups"
  name                         = "jnr_dev"
  aws_iam_group_policy         = "${data.template_file.policy.rendered}"
}