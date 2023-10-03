variable "resource_group_name" {
   type = string
   description = "The name of the resource group in which to create the resources."
}

variable "location" {
   type = string
   description = "The Azure Region in which to create the resources."
   default = "westeurope"
}

variable "website_name" {
   type = string
   description = "The name of the web app."
}

variable "websute_sku" {
   type = string
   description = "The SKU of the web app."
   default = "Free"
}