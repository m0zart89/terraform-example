output "app_external_ip" {
  value = openstack_compute_instance_v2.vm1[0].access_ip_v4
}