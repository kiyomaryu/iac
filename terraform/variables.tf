variable "project" {
  type        = string
  // ここにプロジェクトIDを入れる
  default     = ""
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
  # default = "us-central1-c"
  default = "us-west1-b"
}