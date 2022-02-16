variable "project" {
  type        = string
  default     = "ここにGCPのプロジェクトIDをいれる"
  description = "GCP project id"
}

variable "stage" {
  type = string
  default     = "dev"
  description = "default stage"
}

variable "region" {
  type = string
  default     = "us-west1"
  description = "default region"
}

variable "zone" {
  type = string
  default = "us-west1-b"
}