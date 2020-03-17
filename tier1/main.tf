provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "admin_ssh_key" {
  name = "admin_ssh_key"
}

data "local_file" "cloud_init" {
  filename = "${path.module}/cloud-init.yml"
}

resource "digitalocean_droplet" "stainsbury" {
  image  = var.image
  name   = var.droplet_name
  region = var.region
  size   = var.size
  ssh_keys = [data.digitalocean_ssh_key.admin_ssh_key.id]
  tags = ["firewall:webserver", "type:stainsbury"]

  user_data = data.local_file.cloud_init.content
}
