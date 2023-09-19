terraform {
  required_version = ">= 0.14.5"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.98.0"
    }

  }
}

terraform {
backend "s3" {}
}
