terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }
  terraform {
    source = "../../../../..//modules/aws/core/iam/users"
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

username  = "normal1"
