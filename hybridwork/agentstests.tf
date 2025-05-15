locals {
  agents = csvdecode(file("${path.module}/agentstests.csv"))
  agents_id  = [for row in local.agents : tonumber(row.agent_id)]
}
