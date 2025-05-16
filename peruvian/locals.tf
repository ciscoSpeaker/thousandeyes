locals {
  bgpmonitor = csvdecode(file("${path.module}/bgpmonitor.csv"))
  bgpmonitor_id  = [for row in local.bgpmonitor : tonumber(row.monitorId)]
}

locals {
  HTTPalerts = csvdecode(file("${path.module}/alertsHTTP.csv"))
  HTTPalerts_id  = [for row in local.HTTPalerts : tonumber(row.http_alert_id)]
}

locals {
  DNSalerts = csvdecode(file("${path.module}/alertsDNS.csv"))
  DNSalerts_id  = [for row in local.DNSalerts : tonumber(row.dns_alert_id)]
}

locals {
  transaction = csvdecode(file("${path.module}/transaction.csv"))
  }

locals {
  tests = csvdecode(file("${path.module}/tests.csv"))
  }

#### Agents

locals {
  agentsLima = csvdecode(file("${path.module}/agentsLima.csv"))
  agentsLima_name_id = {for ag_name in local.agentsLima : ag_name.agent_name => ag_name.agent_id}
  }

locals {
  agentsRPi = jsondecode(file("${path.module}/agentsRPi.json")) 
  agentsRPi_name_id = {for ag_name in local.agentsRPi.agents : ag_name.agentName => ag_name.agentId}
  agentRPi_name = keys(local.agentsRPi_name_id)
  agentRPi_id = values(local.agentsRPi_name_id) 
  }

locals {
  agentsPeru = merge (local.agentsLima_name_id, local.agentsRPi_name_id)
  agentPeru_name = keys(local.agentsPeru)
  agentPeru_id = values(local.agentsPeru) 
}

locals {
  agentsTransaction = csvdecode(file("${path.module}/agentsTransaction.csv"))
  agentsTransaction_name_id = {for ag_name in local.agentsTransaction : ag_name.agent_name => ag_name.agent_id}
  }
