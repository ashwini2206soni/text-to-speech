terraform {
  backend "gcs" {
    bucket  = "tf-state-bucket-2206"
    prefix  = "tf-backend"
  }
}