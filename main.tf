resource "google_bigtable_instance_iam_member" "bigtable_instance_iam_members" {
  for_each = var.bigtable_instance_iam_members

  instance = each.value.instance
  member   = each.value.member
  role     = each.value.role
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

