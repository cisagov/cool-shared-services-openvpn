# This is the "default" provider that is used to obtain the caller's
# credentials, which are used to set the session name when assuming roles in
# the other providers.

provider "aws" {
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to lookup account IDs.  See locals.
provider "aws" {
  alias = "organizationsreadonly"
  assume_role {
    role_arn     = data.terraform_remote_state.master.outputs.organizationsreadonly_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to modify public cyber.dhs.gov DNS resources inside
# the DNS account.
provider "aws" {
  alias = "public_dns"
  assume_role {
    role_arn     = data.terraform_remote_state.public_dns.outputs.route53resourcechange_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create IAM roles that can read selected certificates
# in the certificates bucket in the DNS account.
provider "aws" {
  alias = "provision_certificate_read_role"
  assume_role {
    role_arn     = data.terraform_remote_state.dns_certboto.outputs.provisioncertificatereadroles_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create resources inside the Shared Services account.
provider "aws" {
  alias = "provision_sharedservices"
  assume_role {
    role_arn     = data.terraform_remote_state.sharedservices.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create IAM roles that can read selected
# SSM ParameterStore parameters in the Images account.
provider "aws" {
  alias = "provision_ssm_parameter_read_role"
  assume_role {
    role_arn     = data.terraform_remote_state.images_parameterstore.outputs.provisionparameterstorereadroles_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}
