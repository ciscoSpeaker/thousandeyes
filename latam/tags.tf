locals {
  tag_country_rows = csvdecode(file("${path.module}/agentsCloudFrom.csv"))
  tag_test_rows    = csvdecode(file("${path.module}/tagAssignment.csv"))

  countries = sort(distinct([
    for row in local.tag_country_rows : trimspace(row.agent_country_full)
  ]))

  cloud_providers = sort(distinct([
    for row in local.tag_test_rows : trimspace(row.cloud_provider)
  ]))

  regions = sort(distinct([
    for row in local.tag_test_rows : trimspace(row.region_tag)
  ]))

  cloud_provider_groups = sort(distinct([
    for row in local.tag_test_rows : trimspace(row.cloud_provider_group)
  ]))
}

resource "thousandeyes_tag" "country" {
  for_each = toset(local.countries)

  key         = "country"
  value       = each.value
  object_type = "test"
  access_type = "all"
}

resource "thousandeyes_tag" "cloud_provider" {
  for_each = toset(local.cloud_providers)

  key         = "cloud_provider"
  value       = each.value
  object_type = "test"
  access_type = "all"
}

resource "thousandeyes_tag" "region" {
  for_each = toset(local.regions)

  key         = "region"
  value       = each.value
  object_type = "test"
  access_type = "all"
}

resource "thousandeyes_tag" "cloud_provider_group" {
  for_each = toset(local.cloud_provider_groups)

  key         = "cloud_provider_group"
  value       = each.value
  object_type = "test"
  access_type = "all"
}
