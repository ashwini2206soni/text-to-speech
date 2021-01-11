terraform {
  backend "gcs" {
    bucket  = "tf-state-bucket-2206"
  }
}