project     = "text-to-speech-300902"
region      = "us-central1"
bucket_name = "text-to-speech-bucket-2206"

gcs_storage_object ={
    name   = "index.zip"
    bucket = "text-to-speech-bucket-2206"
    source = "./cloud_function_code/function-source.zip"
    
}
cloud_function = {
    name        = "tts-function"
    description = "My function"
    runtime     = "python38"

    available_memory_mb   = 256
    source_archive_bucket = "text-to-speech-bucket-2206"
    source_archive_object = "index.zip"
    trigger_http          = true
    entry_point           = "hello_world"
}