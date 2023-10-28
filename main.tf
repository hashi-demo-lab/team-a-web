data "tfe_outputs" "foo" {
  organization = "hashi-demos-apj"
  workspace    = "team-a-ec2"
}

data "vault_kv_secret_v2" "secret_role" {
  mount = "demo-key-value"
  name  = "aarons-secrets"
}

locals {
  vault_data = data.vault_kv_secret_v2.secret_role
}

resource "aws_ssm_document" "web-script-document" {
  name            = "vault_script_document_${var.deployment_id}"
  document_type   = "Command"
  document_format = "YAML"
  content         = templatefile("${path.root}/app.yaml", { description = data.vault_kv_secret_v2.secret_role.data["role"] })
}

resource "aws_ssm_association" "webpage-setup" {
  name = aws_ssm_document.web-script-document.name

  targets {
    key    = "InstanceIds"
    values = [ nonsensitive(data.tfe_outputs.foo.values.instance_id) ]
  }
}