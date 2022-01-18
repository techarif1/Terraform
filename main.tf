terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}

provider "google" {
  credentials = "${file("serivice-account.json)}"
  project     = "skilful-sensor-335405"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "arif18jan"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
   network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
 } 
}
