variable "location" {
  type        = string
  description = "Location code"
}

variable "project" {
  type        = string
  description = "Project code"
}

variable "environment" {
  type        = string
  description = "Environment code"
}

variable "applications" {
  type        = list(string)
  description = "Application names"

}