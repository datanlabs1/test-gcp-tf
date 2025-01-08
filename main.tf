

resource "google_compute_network" "dnl-vpc-tf" {
  name = "dnl-vpc-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "dnl-custom-vpc-tf" {
  name = "dnl-custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name = "sub-sg"
  network = google_compute_network.dnl-custom-vpc-tf.id
  ip_cidr_range = "10.0.0.0/24"
  region = "asia-southeast1"
  private_ip_google_access = true

}

resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.dnl-custom-vpc-tf.id
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
  priority = 455
}



output "dnl" {
  value = google_compute_network.dnl-vpc-tf.id
}

output "dnl-custom" {
  value = google_compute_network.dnl-custom-vpc-tf.id
}
