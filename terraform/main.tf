resource "google_storage_bucket" "bucket" {
  name = var.bucket_name  
}

resource "google_storage_bucket_object" "archive" {
  name   = lookup(var.gcs_storage_object, "name", "")
  bucket = lookup(var.gcs_storage_object, "bucket", "")
  source = lookup(var.gcs_storage_object, "source", "")
}

resource "google_cloudfunctions_function" "function" {
  depends_on = [ google_storage_bucket_object.archive, ]
  name        = lookup(var.cloud_function, "name", "")
  description = lookup(var.cloud_function, "description", "")
  runtime     = lookup(var.cloud_function, "runtime", "")

  available_memory_mb   = lookup(var.cloud_function, "available_memory_mb", 256)
  source_archive_bucket = lookup(var.cloud_function, "source_archive_bucket", "")
  source_archive_object = lookup(var.cloud_function, "source_archive_object", "")
  trigger_http          = lookup(var.cloud_function, "trigger_http", true)
  entry_point           = lookup(var.cloud_function, "entry_point", "")
}

