variable "location" {
    description = "The Azure Region in which all resources will be created."
    type        = string
    default = "westeurope"
}

variable "env" {
    description = "The environment in which the resources will be created."
    type        = string
    default = "dev"
}

variable "CLOUDFLARE_API_TOKEN" {
  type = string
  sensitive = true
}
