terraform {
provider "google" {
  credentials = "${file("serivice-account.json)}"
  project     = "skilful-sensor-335405"
  region      = "us-central1"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
}
