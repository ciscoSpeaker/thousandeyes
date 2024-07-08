locals {
  agentsLima = csvdecode(file("${path.module}/agentsLima.csv"))
  agentsLima_name_id = {for ag_name in local.agentsLima : ag_name.agent_name => ag_name.agent_id}
  }
  
#deleted
#1319575,"Lima, Peru - IPv6 (Claro)","PE","Lima, Peru"
#266386,"Lima, Peru - IPv6","PE","Lima, Peru"

output "agents_Lima" {
  value = local.agentsLima_name_id
}

locals {
  agentsRPi = jsondecode(file("${path.module}/agentsRPi.json")) 
  agentsRPi_name_id = {for ag_name in local.agentsRPi.agents : ag_name.agentName => ag_name.agentId}
  agentRPi_name = keys(local.agentsRPi_name_id)
  agentRPi_id = values(local.agentsRPi_name_id) 
  }

output "agents_RPi" {
  value = local.agentsRPi_name_id
}

locals {
  agentsPeru = merge (local.agentsLima_name_id, local.agentsRPi_name_id)
  agentPeru_name = keys(local.agentsPeru)
  agentPeru_id = values(local.agentsPeru) 
}

output "agents_Peru" {
  value = local.agentsPeru
}