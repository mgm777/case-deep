variable "project" {
    description = "Nome do projeto utilizado no recurso"
    type = string
    default = "case-project"
}

variable "region" {
  description = "Região em que os recursos serão alocados"
  type = string
  default = "us-east1"
}

variable "location_bucket" {
  description = "value"
  type = string
  default = "us-east1"
}