terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.230"
    }
  }
  required_version = ">= 1.6.0"
}

provider "alicloud" {
  region = "ap-southeast-1"
}

# Enforces cost-allocation tagging at the policy level -- untagged spend
# is invisible spend, so this denies RunInstances calls that don't carry
# a CostCenter tag, rather than relying on everyone remembering to tag.
resource "alicloud_resource_manager_policy" "require_tags" {
  policy_name = "require-cost-center-tag"
  policy_document = jsonencode({
    Version = "1"
    Statement = [{
      Effect   = "Deny"
      Action   = "ecs:RunInstances"
      Resource = "*"
      Condition = {
        StringNotEqualsIfExists = {
          "aliyun:CostCenter" = "*"
        }
      }
    }]
  })
}
