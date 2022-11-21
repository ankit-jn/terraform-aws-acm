variable "domain_name" {
  description = "(Required) Domain name for which the certificate should be issued"
  type        = string
}

variable "validation_method" {
    description = "Method to use for Certificate validation."
    type        = string
    default     = "DNS"

    validation {
        condition = contains(["DNS", "EMAIL", "NONE"], var.validation_method)
        error_message = "Possible Values for ACM provided certificates are `DNS` and `EMAIL` while `NONE` for imported certificate."
    } 
}

variable "alternative_domains" {
    description = "(Optional) Set of domains that should be SANs in the issued certificate."
    type        = list(string)
    default     = []
}

variable "record_certificate_details" {
    description = "Flag to decide if certificate details should be added to a certificate transparency log."
    type        = bool
    default     = true
}

variable "validation_options" {
    description = "Options of initial validation of each domain name if `validation_method` is set as `EMAIL`"
    type        = list(map(string))
    default     = []
 
}
variable "tags" {
  description = "(Optional) A map of tags to assign to the certificate."
  type        = map(string)
  default     = {}
}

variable "validate_certificate" {
    description = "Flag to decide if Validation should be done"
    type        = bool
    default     = true
}

variable "validation_records_fqdns" {
  description = "Fully Qualified DNS if the DNS validation records are already exist and if `validation_method` is set `DNS"
  type        = list(string)
  default     = []
}

variable "hosted_zone_id" {
    description = "Hosted Zone Id"
    type        = string
    default     = null
}

variable "ttl" {
    description = "The TTL of the record."
    type        = number
    default     = 60
}

variable "overwrite_records" {
    description = "Allow creation of this record in Terraform to overwrite an existing record, if any."
    type        = bool
    default     = false
}