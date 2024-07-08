locals {
  agentsLima = csvdecode(file("${path.module}/agentsLima.csv"))
  agentsLima_id_name = {for ag_name in local.agentsLima : ag_name.agent_name => ag_name.agent_id}
  agentLima_name = keys(local.agentsLima_id_name)
  agentLima_id = values(local.agentsLima_id_name) 
  }

output "agents_Lima" {
  value = local.agentsLima_id_name
}