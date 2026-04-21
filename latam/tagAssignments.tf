locals {
  tag_country_rows = csvdecode(file("${path.module}/agentsCloudFrom.csv"))
  tag_test_rows    = csvdecode(file("${path.module}/tagAssignment.csv"))

  countries = sort(distinct([
    for row in local.tag_country_rows : trimspace(row.agent_country_full)
  ]))

  test_ids = sort(distinct([
    for row in local.tag_test_rows : tostring(row.test_id)
  ]))

  tests_by_cloud_provider = {
    for value in sort(distinct([for row in local.tag_test_rows : trimspace(row.cloud_provider)])) : value => [
      for row in local.tag_test_rows : tostring(row.test_id)
      if trimspace(row.cloud_provider) == value
    ]
  }

  tests_by_region = {
    for value in sort(distinct([for row in local.tag_test_rows : trimspace(row.region_tag)])) : value => [
      for row in local.tag_test_rows : tostring(row.test_id)
      if trimspace(row.region_tag) == value
    ]
  }

  tests_by_cloud_provider_group = {
    for value in sort(distinct([for row in local.tag_test_rows : trimspace(row.cloud_provider_group)])) : value => [
      for row in local.tag_test_rows : tostring(row.test_id)
      if trimspace(row.cloud_provider_group) == value
    ]
  }
}

resource "thousandeyes_tag_assignment" "country" {
  for_each = thousandeyes_tag.country

  tag_id = each.value.id

  dynamic "assignments" {
    for_each = local.test_ids
    content {
      id          = assignments.value
      object_type = "test"
    }
  }
}

resource "thousandeyes_tag_assignment" "cloud_provider" {
  for_each = thousandeyes_tag.cloud_provider

  tag_id = each.value.id

  dynamic "assignments" {
    for_each = local.tests_by_cloud_provider[each.key]
    content {
      id          = assignments.value
      object_type = "test"
    }
  }
}

resource "thousandeyes_tag_assignment" "region" {
  for_each = thousandeyes_tag.region

  tag_id = each.value.id

  dynamic "assignments" {
    for_each = local.tests_by_region[each.key]
    content {
      id          = assignments.value
      object_type = "test"
    }
  }
}

resource "thousandeyes_tag_assignment" "cloud_provider_group" {
  for_each = thousandeyes_tag.cloud_provider_group

  tag_id = each.value.id

  dynamic "assignments" {
    for_each = local.tests_by_cloud_provider_group[each.key]
    content {
      id          = assignments.value
      object_type = "test"
    }
  }
}
