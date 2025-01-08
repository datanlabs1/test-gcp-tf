terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.14.0"
    }
  }
}

provider "google" {
  project = "datanlabs01"
  region  = "us-east1"
  zone    = "us-east-c"
}

resource google_storage_bucket "dnls3" {
  name="buk-user-pass"
  location="us-east1"
  
}
