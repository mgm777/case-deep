variable "project" {
  description = "Nome do projeto utilizado no recurso"
  type        = string
  default     = "case-deep0001"
}

variable "region" {
  description = "Região em que os recursos serão alocados"
  type        = string
  default     = "us-east1"
}

variable "location_bucket" {
  description = "value"
  type        = string
  default     = "us-east1"
}

variable "name_bucket_terraform" {
  description = "Nome do bucket usado para armazenar o estado do Terraform"
  type        = string
  default     = "terraform-deep"
}