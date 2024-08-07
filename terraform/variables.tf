variable "project_id" {
  description = "Nome do projeto utilizado no recurso"
  type        = string
  default     = "case-deep0001"
}

variable "region" {
  description = "Região em que os recursos serão alocados"
  type        = string
  default     = "us-east1"
}

variable "location" {
  description = "value"
  type        = string
  default     = "us-east1"
}

variable "cloudrun_name_front" {
  description = "Nome do Cloudrun responsável pelo Frontend"
  type = string
  default = "run-front"
  
}

variable "image_front" {
  description = "Caminho da imagem do Frontend"
  type = string
  default = "us-east1-docker.pkg.dev/case-deep0001/deep-front/frontend"
}

variable "cloudrun_name_back" {
  description = "Nome do Cloudrun responsável pelo Backend"
  type = string
  default = "run-back"
  
}

variable "image_back" {
  description = "Caminho da imagem do Backend"
  type = string
  default = "us-east1-docker.pkg.dev/case-deep0001/deep-back/backend"
}

variable "front_repo_name" {
  description = "Nome do repositório de imagens do frontend"
  type = string
  default = "deep-front"
  
}

variable "back_repo_name" {
  description = "Nome do repositório de imagens do backend"
  type = string
  default = "deep-back"
  
}

variable "container_name_front" {
  description = "Nome do container gerado no cloud Run"
  type = string
  default = "front-svc"
  
}
variable "container_name_back" {
  description = "Nome do container gerado no Cloud Run"
  type = string
  default = "back-svc"
  
}

variable "apply_cloud_run" {
  description = "Flag to apply Cloud Run resources"
  type        = bool
  default     = true
}