resource "openstack_compute_instance_v2" "vm1" {

  count             = "1"
  name              = "demo2"
  image_name        = "custom-ubuntu-16"
  availability_zone = "nova"
  flavor_name       = "basic20.xs"
  key_pair          = "imported-openssh-key"
  config_drive      = true
  security_groups   = ["default"]

  network {
    name = "external_network"
  }

  connection {
    user        = "root"
    host        = openstack_compute_instance_v2.vm1[0].access_ip_v4
    private_key = file("/root/123.pri")
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"terraform executed\" > /tmp/foo",
    ]
  }

}
