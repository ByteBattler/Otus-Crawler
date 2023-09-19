terraform {
  required_version = ">= 0.14.5"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.98.0"
    }

  }
}

data "yandex_compute_instance" "monitoring_instance" {
  name = "monitoring"
}

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
  {
    instance_app_ip = yandex_compute_instance.app_instance[*].network_interface.0.nat_ip_address,
    instance_monitoring_ip = data.yandex_compute_instance.monitoring_instance[*].network_interface.0.nat_ip_address
  }
  )
  filename = "../ansible/environments/prod/inventory"
  directory_permission = "0755"
  file_permission = "0644"
}
