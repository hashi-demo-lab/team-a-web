variable "vault_address" {
  description = "HashiCorp Vault Address"
  type        = string
  default     = ""
}

variable "deployment_id" {
  description = "Deployment ID"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}