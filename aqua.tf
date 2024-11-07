# get provider
terraform {
  required_providers {
    aquasec = {
      # version = "0.8.12"
      source = "aquasecurity/aquasec"
    }
  }
}


// login to Aqua Console
provider "aquasec" {
  username = "Andreas.Muller@aquasec.com"     // Alternatively sourced from $AQUA_USER
  aqua_url = "https://eu-1.cloud.aquasec.com" // Alternatively sourced from $AQUA_URL
  password = "Log69in!01"                     // Alternatively sourced from $AQUA_PASSWORD

  // If you are using unverifiable certificates (e.g. self-signed) you may need to disable certificate verification
  verify_tls = false // Alternatively sourced from $AQUA_TLS_VERIFY

  /*
Alternatively, you can provide these configurations from a config file, and configure the provider as below
config_path = '/path/to/tf.config' // defaults to '~/.aqua/tf.config' -- Alternatively sourced from $AQUA_CONFIG
*/
}

# ### User Manipulation:
# # create a new user
# resource "aquasec_user" "IaC" {
# user_id = "IaC"
# password = "Log69in!01"
# roles = [
# "Administrator"
# ]

# //optional fields
# email = "infrastructure@example.com"
# first_time = true // Require password reset upon initial login
# name = "Infrastructure as Code" // Display name for this user
# }

# # get all Aqua local users - der neue user ist da aber noch nicht dabei
# data "aquasec_users" "MyUsers" {}

# # output user name of the first user
# output "first_user_name" {
# value = data.aquasec_users.MyUsers.users[0].name // output: first_user_name = "administrator"
# }


# ### Image Manipulation:
# # register a new image
# resource "aquasec_image" "centos_latest" {
# registry = "Docker Hub"
# repository = "centos"
# tag = "latest"
# }


# # get all data of this image
# data "aquasec_image" "MyImage" {
# registry = "Docker Hub"
# repository = "aquasec/kube-bench"
# tag = "v0.6.10"
# }

# # output image name of this image
# output "MyImage_name" {
# value = data.aquasec_image.MyImage.name
# }

# create container runtime policy with Additional Scope Criteria: 
# image.name.* OR kubernetes.namespace.* AND NOT kubernetes.label."doesnotapply"."true"
resource "aquasec_container_runtime_policy" "container_runtime_policy" {
  name        = "AndreasM_container_runtime_policy"
  description = "AndreasM_container_runtime_policy"
  enabled     = true
  enforce     = false

  scope_variables {
    attribute = "image.name"
    value     = "*"
  }
  scope_variables {
    attribute = "kubernetes.namespace"
    value     = "*"
  }
  scope_variables {
    attribute = "kubernetes.label"
    name      = "doesnotapply"
    value     = "true"
  }

  scope_expression = "v1 || v2 && !v3"
}
