# Variables with default values or values specified in an {env}.tfvars file

variable "product" {
}

variable "product_name_short" {
  default = "tt"
}

variable "location" {
  type = "string"
  default = "UK South"
}

variable "common_tags" {
  type = "map"
}

variable "subscription" {
}

# Database

variable "db_name" {
}

variable "db_storage_mb" {
  default = "5120"
}

variable "component" {
  type = "string"
  default = "service"
}

variable "db_version" {
  type = "number"
  default = 11
}

variable "db_postgresql_user" {
  type = "string"
  default = "tax_tribunals_postgresql_user"
}

# Keyvault

variable "product_group_name" {
  type    = "string"
  default = "dcd_group_pet_v2"
}
