resource "thousandeyes_agent_to_agent" "Lima" {
  for_each = tomap({ for inst in local.agentsLimaFrom : inst.agent_name => inst })
  test_name =  "Lima to ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  alerts_enabled = var.alerts
  dscp = var.dscp
  dynamic "agents" {
    for_each = local.agentLimaTo_id
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "Lima_IPv6" {
  for_each = tomap({ for inst in local.agentsLimaIPv6From : inst.agent_name => inst })
  test_name =  "Lima IPv6 to ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  alerts_enabled = var.alerts
  dscp = var.dscp
  dynamic "agents" {
    for_each = local.agentLimaIPv6To_id
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "Mexico_City" {
  for_each = tomap({ for inst in local.agentsMexicoCityFrom : inst.agent_name => inst })
  test_name =  "Mexico City to ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  alerts_enabled = var.alerts
  dscp = var.dscp
  dynamic "agents" {
    for_each = local.agentMexicoCityTo_id
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "Mexico_City_IPv6" {
  for_each = tomap({ for inst in local.agentsMexicoCityIPv6From : inst.agent_name => inst })
  test_name =  "Mexico City IPv6 to ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  alerts_enabled = var.alerts
  dscp = var.dscp
  dynamic "agents" {
    for_each = local.agentMexicoCityIPv6To_id
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "Santiago" {
  for_each = tomap({ for inst in local.agentsSantiagoFrom : inst.agent_name => inst })
  test_name =  "Santiago to ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  alerts_enabled = var.alerts
  dscp = var.dscp
  dynamic "agents" {
    for_each = local.agentSantiagoTo_id
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "Santiago_IPv6" {
  for_each = tomap({ for inst in local.agentsSantiagoIPv6From : inst.agent_name => inst })
  test_name =  "Santiago IPv6 to ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  alerts_enabled = var.alerts
  dscp = var.dscp
  dynamic "agents" {
    for_each = local.agentSantiagoIPv6To_id
    content  {
    agent_id   = agents.value
    }
  }
}