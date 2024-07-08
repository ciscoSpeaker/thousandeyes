locals {
  agentsLima = csvdecode(file("${path.module}/agentsLima.csv"))
  agentsLima_id_name = {for ag_name in local.agentsLima : ag_name.agent_id => ag_name.agent_name}
  agentLima_id = keys(local.agentsLima_id_name)
  agentLima_name = values(local.agentsLima_id_name) 
  }

output "agents_Lima" {
  value = local.agentsLima_id_name
}

# deleteIPv6
# 1319575,"Lima, Peru - IPv6 (Claro)","PE","Lima, Peru"
# 266386,"Lima, Peru - IPv6","PE","Lima, Peru"
