output "id" {
  value = "${digitalocean_droplet.stainsbury.id}"
}

output "name" {
  value = "${digitalocean_droplet.stainsbury.name}"
}

output "address" {
  value = "${digitalocean_droplet.stainsbury.ipv4_address}"
}

output "message" {
  value = "Droplet created. It may take several minutes before SSH access is available."
}
