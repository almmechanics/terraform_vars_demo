variable "string_length" {
  description = "length of random string"
  type        = string
}

variable "client_secret" {
  description = "client secret"
  type        = string
}

variable "location" {
  description = "Azure region to be deployed into."
  type        = string
}

variable "instance" {
  description = "target instance."
  type        = string
}
