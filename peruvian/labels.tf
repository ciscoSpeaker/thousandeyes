locals {
  labels = csvdecode(file("${path.module}/labels.csv"))
  }

resource "thousandeyes_label" "label" {
  for_each = tomap({ for inst in local.labels : inst.label_resource => inst })
  name =  each.value.label_name
  type = each.value.label_type
}