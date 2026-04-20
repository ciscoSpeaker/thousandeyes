locals {
  A2Aalerts    = csvdecode(file("${path.module}/A2Aalerts.csv"))
  A2Aalerts_id = [for row in local.A2Aalerts : tostring(row.a2a_alert_id)]
}