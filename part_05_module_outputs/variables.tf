variable "environment" {
    type = string
}

variable "location" {
    type = string
    default = "westeurope"
}

variable "GITHUB_TOKEN" {
    type = string
    sensitive = true
}