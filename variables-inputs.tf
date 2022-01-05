# Variables to be specified when creating this infrastructure.

variable "subscription" {
  type = "string"
}

# Keyvault

variable "tenant_id" {
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "jenkins_AAD_objectId" {
  type        = "string"
  description = "(Required) The Azure AD object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
}