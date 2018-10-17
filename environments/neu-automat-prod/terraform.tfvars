terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket     = "neu-automat-terraform-state"
      key        = "NEU-AUTOMAT-PROD/${path_relative_to_include()}/terraform.tfstate"
      region     = "eu-west-1"
      encrypt    = true
      lock_table = "neu-automat-terraform-lock"
    }
  }
}

environment 	       = "neu-automat-prod"
region                 = "eu-west-1"