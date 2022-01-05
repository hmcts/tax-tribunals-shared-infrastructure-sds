# Variables with default values or values specified in an {env}.tfvars file

variable "product" {
  type = "string"
  default = "tax-tribunals"
}

variable "location" {
  type = "string"
  default = "UK South"
}

variable "common_tags" {
  type = "map"
  default = {
    "tag_service" = "tt",
    "tag_project_name" = "pet-devops",
    "tag_cost_center" = "iCode-Drone",
    "tag_app_operations_owner" = "pet-devops",
    "tag_system_owner" = "pet-devops",
    "tag_budget_owner" = "pet-devops"
  }
}

variable "env" {
  type = "string"
}

# Database

variable "db_name" {
  type = "string"
}

variable "db_storage_mb" {
  type = "string"
}

variable "db_component_name" {
  type = "string"
  default = "postgres-database"
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
