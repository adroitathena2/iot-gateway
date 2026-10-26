terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "iot_config" {
  filename = "${path.module}/iot_config.env"
  content  = "MQTT_PORT=1883\n"
}
