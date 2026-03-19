resource "thousandeyes_tag_assignment" "csv_assignments" {
  for_each = local.grouped_assignments

  tag_id = merge(
    local.existing_tag_ids,
    { for k, v in thousandeyes_tag.csv_tags : k => v.id }
  )[each.key]

  dynamic "assignments" {
    for_each = each.value
    content {
      id   = assignments.value.id
      type = assignments.value.type
    }
  }
}