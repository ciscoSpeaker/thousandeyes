locals {
  agentsFromLima = csvdecode(file("${path.module}/agentsFromLima.csv"))
  agentsFromLima_id_name = {for ag_name in local.agentsFromLima : ag_name.agent_id => ag_name.agent_name}
  agentFromLima_id = keys(local.agentsFromLima_id_name)
  agentFromLima_name = values(local.agentsFromLima_id_name) 
  }

#output "agents_from_Lima" {
#  value = local.agentsFromLima_id_name
#}