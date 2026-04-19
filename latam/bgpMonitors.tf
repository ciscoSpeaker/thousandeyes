locals {
  bgpMonitors = csvdecode(file("${path.module}/bgpMonitors.csv"))

  bgpMonitor_ids = [
    for m in local.bgpMonitors : tonumber(m.monitor_id)
  ]

  bgpMonitors_map = {
    for m in local.bgpMonitors : tostring(m.monitor_id) => {
      monitor_id   = tonumber(m.monitor_id)
      monitor_name = m.monitor_name
      country_id   = m.country_id
    }
  }
}