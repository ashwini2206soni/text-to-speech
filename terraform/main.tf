provider "google" {
  project     = "text-to-speech-300902"
  region      = "us-central1"
  credentials = "credentials.json"
}

resource "google_storage_bucket" "bucket" {
  name = "text-to-speech-bucket-2206"
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket.name
  source = "../cloud_function_code/function-source.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "tts-function"
  description = "My function"
  runtime     = "python38"

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "hello_world"
}

