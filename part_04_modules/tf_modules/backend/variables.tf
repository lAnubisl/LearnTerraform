variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "environment" {
    type = string
}

variable "function_sku" {
    type = string
    default = "Y1" # Y1 is the cheapest pricing tier. 'Y' stands for Dynamic. That means Consumption Plan.
}