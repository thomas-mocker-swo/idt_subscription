variable "location" {
  type        = string
  description = "The location/region where the resource group will be created."
}

variable "location_short" {
  type        = string
  description = "The location/region where the resource group will be created (short name)."
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the Azure AD tenant."
  nullable    = false
}

variable "subscription_id" {
  type        = string
  description = "The subscription ID of the connectivity subscription."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."
  default     = {}
}

