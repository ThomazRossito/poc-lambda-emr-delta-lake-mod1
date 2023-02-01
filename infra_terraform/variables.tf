variable "location" {
  description = "variavel que indica a regiao dos recursos"
  type        = string
  default     = "us-east-1"
}


variable "account_id" {
  description = "identifica o account id"
  type        = string
  default     = "433046906551"
}


variable "prefix_name" {
  description = "prefix abreviatura meu nome"
  default     = "tarn"
}


variable "lambda_function_name" {
  default = "tarnExecutaEMRBach"
  # default = "ExecutaEMRStream"
}


variable "bucket_names" {
  description = "s3 bucket names"
  type        = list(string)
  default = [
    "datalake-code",
    "datalake-logs",
    "datalake-raw",
    "datalake-silver"
  ]
}