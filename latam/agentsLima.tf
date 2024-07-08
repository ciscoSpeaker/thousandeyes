locals {
  agentsLimaFrom = csvdecode(file("${path.module}/agentsLimaFrom.csv"))
  agentsLimaFrom_id_name = {for ag_name in local.agentsLimaFrom : ag_name.agent_id => ag_name.agent_name}
  agentLimaFrom_id = keys(local.agentsLimaFrom_id_name)
  agentLimaFrom_name = values(local.agentsLimaFrom_id_name) 
  }

locals {
  agentsLimaTo = csvdecode(file("${path.module}/agentsLimaTo.csv"))
  agentsLimaTo_id_name = {for ag_name in local.agentsLimaTo : ag_name.agent_id => ag_name.agent_name}
  agentLimaTo_id = keys(local.agentsLimaTo_id_name)
  agentLimaTo_name = values(local.agentsLimaTo_id_name) 
  }

output "agents_Lima" {
  value = local.agentsLimaTo_id_name
}
