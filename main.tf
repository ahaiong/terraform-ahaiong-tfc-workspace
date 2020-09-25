resource "tfe_workspace" "this" {
  name                        = var.name
  organization                = var.organization_name
  ssh_key_id                  = var.ssh_key_id
  terraform_version           = var.terraform_version
  working_directory           = var.working_directory
  vcs_repo {
    identifier  = var.vcs_identifier
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_variable" "aws_default_region" {
  key          = "AWS_DEFAULT_REGION"
  value        = var.aws_default_region
  category     = "env"
  workspace_id = tfe_workspace.this.id
}

resource "tfe_variable" "aws_access_key_id" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key_id
  category     = "env"
  workspace_id = tfe_workspace.this.id
}

resource "tfe_variable" "aws_access_key" {
  sensitive    = true
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_access_key
  category     = "env"
  workspace_id = tfe_workspace.this.id
}
