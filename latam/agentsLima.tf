locals {
  agentsLimaFrom = csvdecode(file("${path.module}/agentsLimaFrom.csv"))
  agentsLimaFrom_id_name = {for ag_name in local.agentsLimaFrom : ag_name.agent_id => ag_name.agent_name}
  agentLimaFrom_id = keys(local.agentsLimaFrom_id_name)
  agentLimaFrom_name = values(local.agentsLimaFrom_id_name) 
  }
