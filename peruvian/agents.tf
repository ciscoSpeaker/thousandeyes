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
  agentRPi_name = keys(local.agentsRPi_name_id)
  agentRPi_id = values(local.agentsRPi_name_id) 
  }

output "agents_RPi" {
  value = local.agentsRPi_name_id
}

output "agents_RPi_id" {
  value = local.agentRPi_id
}

locals {
  agentsPeru = merge (local.agentsLima_name_id, local.agentsRPi_name_id)
  agentPeru_name = keys(local.agentsPeru)
  agentPeru_id = values(local.agentsPeru) 
}

output "agents_Peru" {
  value = local.agentsPeru
}


locals {
  agentsTransaction = csvdecode(file("${path.module}/agentsTransaction.csv"))
  agentsTransaction_name_id = {for ag_name in local.agentsTransaction : ag_name.agent_name => ag_name.agent_id}
  }

output "agents_Transaction" {
  value = local.agentsTransaction_name_id
}