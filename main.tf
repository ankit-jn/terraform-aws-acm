resource aws_acm_certificate "this" {

    domain_name               = var.domain_name
    subject_alternative_names = var.alternative_domains
    
    validation_method = var.validation_method

    options {
        certificate_transparency_logging_preference = var.record_certificate_details ? "ENABLED" : "DISABLED"
    }

    dynamic "validation_option" {
        for_each = (var.validation_method == "EMAIL") ? var.validation_options : []

        content {
            domain_name       = validation_option.value.domain_name
            validation_domain = validation_option.value.validation_domain
        }
    }
    
    tags = var.tags

    lifecycle {
        create_before_destroy = true
    }
}

resource aws_acm_certificate_validation "this" {
    count = (var.validation_method != "NONE" && var.validate_certificate) ? 1 : 0

    certificate_arn  = aws_acm_certificate.this.arn
    validation_record_fqdns = local.validation_records_fqdns
}

resource aws_route53_record "this" {
    for_each = (var.validation_method == "DNS" && var.validate_certificate) ? { 
                                for domain in local.distinct_domain_names:  domain => domain } : {}

    name    = each.key
    records = [local.record_sets[each.key].record]
    ttl     = var.ttl
    type    = local.record_sets[each.key].type
    zone_id = var.hosted_zone_id

    # This setting as `true` is not encouraged but is an exception 
    # if same domain is used for 2 ACM cert
    # one is at global and other is at regional 
    allow_overwrite = var.overwrite_records
}