terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }
  terraform {
    source = "../../../../..//modules/aws/templates/iam/groups/jnr_dev"
    extra_arguments "custom_vars" {
      commands = [
        "apply",
        "plan",
        "import",
        "push",
        "refresh",
        "destroy"
      ]

      required_var_files = [
        "${get_tfvars_dir()}/../../../terraform.tfvars"
      ]
    }
  }
}

