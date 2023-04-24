provider "aws" {
  region     = "ap-southeast-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

module "lightsail_instance" {
    source = "./modules/lightsail"
    env = var.TFC_WORKSPACE_NAME
    avail_zone = data.aws_availability_zones.available.names[0]
}

# module "create_networking" {
#   source = "./modules/Networking"
# }

# module "manage_IAM_role" {
#   source = "./modules/IAM"
# }

# module "SSM_Parameter" {
#   source         = "./modules/SSM_Parameter"
#   DBPassword     = var.DB_PASSWORD
#   DBRootPassword = var.DB_ROOT_PASSWORD
#   DB-ENDPOINT    = module.RDS_Instance.RDS-ENDPOINT
#   EFS-ID         = module.EFS_Instance.FS-ID
#   ALB-DNS        = module.Launch_EC2_Template.ALB-DNS-NAME
# }

# module "Launch_EC2_Template" {
#   source               = "./modules/EC2"
#   instance-profile     = module.manage_IAM_role.IAM-Instance-Profile-ID
#   WP-security-group-id = module.create_networking.WP-security-group-id
#   SNPUB-A-ID           = module.create_networking.SNPUB-A-ID
#   SNPUB-B-ID           = module.create_networking.SNPUB-B-ID
#   SNPUB-C-ID           = module.create_networking.SNPUB-C-ID
#   RDS-endpoint-address = module.RDS_Instance.RDS-ENDPOINT
#   EFS-ID               = module.EFS_Instance.FS-ID
#   ALB-SG-ID            = module.create_networking.ALB-security-group-id
#   VPC-ID               = module.create_networking.VPC-ID
# }

# module "RDS_Instance" {
#   source          = "./modules/RDS"
#   SNDB-A-ID       = module.create_networking.SNDB-A-ID
#   SNDB-B-ID       = module.create_networking.SNDB-B-ID
#   SNDB-C-ID       = module.create_networking.SNDB-C-ID
#   SSM-DB-NAME     = module.SSM_Parameter.RDS-DB-NAME
#   SSM-DB-USERNAME = module.SSM_Parameter.RDS-DB-USERNAME
#   SSM-DB-PASSWORD = module.SSM_Parameter.RDS-DB-PASSWORD
#   SG-DB-ID        = module.create_networking.DB-security-group-id
#   current-region  = data.aws_region.current.name
# }

# module "EFS_Instance" {
#   source     = "./modules/EFS"
#   SNAPP-A-ID = module.create_networking.SNAPP-A-ID
#   SNAPP-B-ID = module.create_networking.SNAPP-B-ID
#   SNAPP-C-ID = module.create_networking.SNAPP-C-ID
#   EFS-SG-ID  = module.create_networking.EFS-security-group-id
# }