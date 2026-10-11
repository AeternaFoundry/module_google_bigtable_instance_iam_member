variable "bigtable_instance_iam_members" {
  description = <<EOT
Map of bigtable_instance_iam_members, attributes below
Required:
    - instance
    - member
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    instance = string
    member   = string
    role     = string
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

