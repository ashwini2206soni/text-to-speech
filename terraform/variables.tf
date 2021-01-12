variable "project" {
  type = string
  description = "Project ID of the project to be used"  
}
variable "region" {
  type = string
  description = "Region of the project"
}

variable "bucket_name" {
  type = string
  description = "Name of tyhe bucket to be created for cloud function source code"
}

variable "gcs_storage_object" {
  description = "properties of gcs storage object such as name, source path and gcs bucket to be stored in"
}
variable "cloud_function" {
  description = "properties of cloud function"
}