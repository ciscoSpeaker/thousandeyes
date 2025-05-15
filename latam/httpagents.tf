locals {
  httpagents = csvdecode(file("${path.module}/httpagents.csv"))
  httpagents_id_name = {for ag_name in local.httpagents : ag_name.agent_id => ag_name.agent_name}
  httpagents_id = keys(local.httpagents_id_name)
  httpagents_name = values(local.httpagents_id_name) 
  }

#output "agents_http" {
#  value = local.httpagents_id_name
#}