resource "thousandeyes_tag" "csv_tags" {
  for_each = local.tags_to_create

  key         = each.value.key
  value       = each.value.value
  object_type = each.value.object_type
}