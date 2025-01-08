resource "google_compute_instance" "dnl-web-tf" {
  name = "dnl-web-tf"
  zone = "asia-southeast1-a"
  machine_type = "e2-micro"

  allow_stopping_for_update = true

  network_interface {
    network = "dnl-custom-vpc-tf"
    subnetwork = "sub-sg"
  }

  boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20241210"
      size = 10
      
    }
    auto_delete = false
  }

  labels = {
    "env" = "dev"
  }

  
  scheduling {
    preemptible = false
    automatic_restart = false
  }
  

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 4
  zone = "asia-southeast1-a"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.dnl-web-tf.id
}


