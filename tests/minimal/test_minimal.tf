terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "OOB1"
}

data "aci_rest_managed" "vzOOBBrCP" {
  dn = "uni/tn-mgmt/oobbrc-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "vzOOBBrCP" {
  component = "vzOOBBrCP"

  equal "name" {
    description = "name"
    got         = data.aci_rest_managed.vzOOBBrCP.content.name
    want        = module.main.name
  }
}
