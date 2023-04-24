variable "TFC_WORKSPACE_NAME" {
  type = string
  default = ""
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS access key ID"
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS secret key "
  sensitive   = true
}

variable "GITHUB_ACCESS_TOKEN" {
  type        = string
  description = "Github access token"
  sensitive   = true
}

variable "DB_PASSWORD" {
  type        = string
  description = "DB password"
  sensitive   = true
}
variable "DB_ROOT_PASSWORD" {
  type        = string
  description = "DB root password"
  sensitive   = true
}