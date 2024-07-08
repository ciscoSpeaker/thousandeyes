locals {
  agentsLima = csvdecode(file("${path.module}/agentsLima.csv"))
  agentsLima_name_id = {for ag_name in local.agentsLima : ag_name.agent_name => ag_name.agent_id}
  agentLima_name = keys(local.agentsLima_name_id)
  agentLima_id = values(local.agentsLima_name_id) 
  }

output "agents_Lima" {
  value = local.agentsLima_name_id
}

locals {
  agentsRPi = jsondecode(file("${path.module}/agentsRPi.json")) 
  agentsRPi_name_id = {for ag_name in local.agentsRPi.agents : ag_name.agentName => ag_name.agentId}
  agentsRPiName = keys(local.agentsRPi_name_id)
  agentsRPiId = values(local.agentsRPi_name_id) 
  }

output "agents_RPi" {
  value = local.agentsRPi_name_id
}

locals {
  agents = merge (local.agentsLima_name_id, local.agentsRPi_name_id)
}

output "agents_Lima_RPi" {
  value = local.agents
}
