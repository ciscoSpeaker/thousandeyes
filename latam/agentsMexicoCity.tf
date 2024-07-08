locals {
  agentsMexicoCity = csvdecode(file("${path.module}/agentsMexicoCity.csv"))
  agentsMexicoCity_id_name = {for ag_name in local.agentsMexicoCity : ag_name.agent_id => ag_name.agent_name}
  agentMexicoCity_id = keys(local.agentsMexicoCity_id_name)
  agentMexicoCity_name = values(local.agentsMexicoCity_id_name) 
  }

output "agents_MexicoCity" {
  value = local.agentsMexicoCity_id_name
}

# deleteIPv6
# 1302650,"Mexico City, Mexico - IPv6 (TelMex)","MX","Mexico City, Mexico"
# 838841,"Mexico City, Mexico - IPv6","MX","Mexico City, Mexico"
