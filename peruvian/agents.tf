locals {
  agentsLima = csvdecode(file("${path.module}/agentsLima.csv"))
  agentsLima_name_id = {for ag_name in local.agentsLima : ag_name.agent_name => ag_name.agent_id}
  }

output "agents_Lima" {
  value = local.agentsLima_name_id
}

locals {
  agentsRPi = jsondecode(file("${path.module}/agentsRPi.json")) 
  agentsRPi_name_id = {for ag_name in local.agentsRPi.agents : ag_name.agentName => ag_name.agentId}
  }

output "agents_RPi" {
  value = local.agentsRPi_name_id
}

locals {
  agentsPeru = merge (local.agentsLima_name_id, local.agentsRPi_name_id)
  agentPeru_name = keys(local.agentsPeru)
  agentPeru_id = values(local.agentsPeru) 
}

output "agents_Lima_RPi" {
  value = local.agentsPeru
}
