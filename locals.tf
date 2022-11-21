locals {
    distinct_domain_names = toset([ for domain in concat([var.domain_name], var.alternative_domains): 
                                            replace(domain, "*.", "")])

    record_sets = { for val in aws_acm_certificate.this.domain_validation_options: 
                val.domain_name => {
                            name   = val.resource_record_name
                            record = val.resource_record_value
                            type   = val.resource_record_type
                        } }
    validation_records_fqdns = var.validation_method == "DNS" ? flatten(concat([
                                                                            for record in aws_route53_record.this: record.fqdn], 
                                                                            var.validation_records_fqdns)) : null
}
