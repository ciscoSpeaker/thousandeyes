resource "thousandeyes_tag_assignment" "csv_assignments" {
  for_each = local.grouped_assignments

  tag_id = thousandeyes_tag.csv_tags[each.key].id

  dynamic "assignments" {
    for_each = each.value
    content {
      id   = assignments.value.id
      type = assignments.value.type
    }
  }
}
