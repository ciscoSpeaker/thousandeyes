resource "thousandeyes_tag_assignment" "csv_assignments" {
  for_each = local.grouped_assignments

  tag_id = local.existing_tag_ids[each.key]

  dynamic "assignments" {
    for_each = each.value
    content {
      id   = assignments.value.id
      type = assignments.value.type
    }
  }
}