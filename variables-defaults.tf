# Variables with default values or values specified in an {env}.tfvars file

variable "product" {
}

variable "product_name_short" {
  default = "tt"
}

variable "location" {
  default = "UK South"
}

variable "common_tags" {
  type = map(string)
}

variable "subscription" {
}

# Database

variable "db_storage_mb" {
  default = "5120"
}

variable "component" {
  default = "service"
}

variable "db_version" {
  default = 11
}

variable "db_postgresql_user" {
  default = "tax_tribunals_postgresql_user"
}

# Keyvault

variable "product_group_name" {
  default = "dcd_group_pet_v2"
}
