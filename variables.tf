# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cert_create_read_role_arn" {
  description = "The ARN of the role to assume when creating the AWS IAM role to read the OpenVPN server certificate (e.g. \"arn:aws:iam::123456789012:role/CertReadRole\")."
}

variable "default_role_arn" {
  description = "The ARN of the role to assume when performing most Terraform tasks (e.g. \"arn:aws:iam::123456789012:role/TerraformRole\")."
}

variable "dns_role_arn" {
  description = "The ARN of the role to assume when performing public DNS Terraform tasks (e.g. \"arn:aws:iam::123456789012:role/DnsRole\")."
}

variable "freeipa_admin_pw" {
  description = "The password for the Kerberos admin role."
}

variable "freeipa_client_security_group_id" {
  description = "The ID of the FreeIPA client security group (e.g. \"sg-0123456789abcdef0\")."
}

variable "private_reverse_zone_id" {
  description = "The zone ID corresponding to the private Route53 reverse zone appropriate for the IPA master (e.g. \"Z01234567YYYYY89FFF0T\")."
}

variable "private_zone_id" {
  description = "The zone ID corresponding to the private Route53 zone for the COOL shared services VPC (e.g. \"Z01234567YYYYY89FFF0T\")."
}

variable "ssm_create_read_role_arn" {
  description = "The ARN of the role to assume when creating the AWS IAM role to read the SSM data required by the OpenVPN server (e.g. \"arn:aws:iam::123456789012:role/SsmReadRole\")."
}

variable "subnet_id" {
  description = "The ID of the subnet where the IPA master is to be deployed (e.g. \"subnet-0123456789abcdef0\")."
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region where the shared services account is to be created (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "cert_bucket_name" {
  description = "The name of the AWS S3 bucket where certificates are stored."
  default     = "cool-certificates"
}

variable "cool_domain" {
  description = "The domain where the COOL resources reside (e.g. \"cool.cyber.dhs.gov\")."
  default     = "cool.cyber.dhs.gov"
}

variable "public_zone_name" {
  description = "The name of the public Route53 zone where public DNS records should be created (e.g. \"cyber.dhs.gov.\")."
  default     = "cyber.dhs.gov."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}

variable "trusted_cidr_blocks" {
  type        = list(string)
  description = "A list of the CIDR blocks outside the VPC that are allowed to access the IPA servers (e.g. [\"10.10.0.0/16\", \"10.11.0.0/16\"])."
  default     = []
}
