provider "digitalocean" {
  token = var.do_token

  spaces_access_id  = var.do_spaces_access_id
  spaces_secret_key = var.do_spaces_secret_key
}

resource "digitalocean_ssh_key" "default" {
  name       = "admin_ssh_key"
  public_key = var.ssh_keys
}

resource "digitalocean_spaces_bucket" "stainsbury-backups" {
  name   = var.do_bucket
  region = var.do_region
  acl    = "private"
}

resource "digitalocean_tag" "firewall_webserver" {
  name = "firewall:webserver"
}

resource "digitalocean_firewall" "webserver" {
  name = "webserver"

  tags = ["firewall:webserver"]

  inbound_rule {
      protocol           = "tcp"
      port_range         = "22"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    }

  inbound_rule {
      protocol           = "tcp"
      port_range         = "80"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    }

  inbound_rule {
      protocol           = "tcp"
      port_range         = "443"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    }

  inbound_rule {
      protocol           = "icmp"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    }

  outbound_rule {
      protocol                = "tcp"
      port_range              = "53"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    }

  outbound_rule {
      protocol                = "udp"
      port_range              = "53"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    }

  outbound_rule {
      protocol                = "tcp"
      port_range              = "80"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    }

  outbound_rule {
      protocol                = "tcp"
      port_range              = "443"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    }

  outbound_rule {
      protocol                = "icmp"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    }
}
