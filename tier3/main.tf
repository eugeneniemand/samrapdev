data "digitalocean_droplet" "stainsbury" {
  name = "${var.droplet_name}"
}

resource "digitalocean_floating_ip_assignment" "stainsbury" {
  ip_address = "${var.floating_ip_address}"
  droplet_id = "${data.digitalocean_droplet.stainsbury.id}"
}
