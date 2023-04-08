## ARJ-Stack: AWS Certificate Manager (ACM) Terraform module

A Terraform module for provisioning Certificate from ACM

### Resources
This module features the following components to be provisioned:

- Certificate [[aws_acm_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate)]
- Certificate Validation [[aws_acm_certificate_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation)]
- Route53 Records for Certificate Validation (DNS) [[aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record)]

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.22.0 |

### Examples

Refer [Configuration Examples](https://github.com/ankit-jn/terraform-aws-examples/tree/main/aws-acm) for effectively utilizing this module.

### Inputs
---

| Name | Description | Type | Default | Required | Example|
|:------|:------|:------|:------|:------:|:------|
| <a name="domain_name"></a> [domain_name](#input\_domain\_name) | Domain name for which the certificate should be issued. | `string` |  | yes | `"arjstack.in"` |
| <a name="validation_method"></a> [validation_method](#input\_validation\_method) | Method to use for Certificate validation. | `string` | `"DNS"` | no |  |
| <a name="alternative_domains"></a> [alternative_domains](#input\_alternative\_domains) | Set of domains that should be SANs in the issued certificate. | `list(string)` | `[]` | no | <pre>[<br>  "academic.arjstack.in",<br>  "*.arjstack.in"<br>] |
| <a name="record_certificate_details"></a> [record_certificate_details](#input\_record\_certificate\_details) | Flag to decide if certificate details should be added to a certificate transparency log. | `bool` | `true` | no |  |
| <a name="validation_options"></a> [validation_options](#input\_validation\_options) | Options of initial validation of each domain name if `validation_method` is set as `EMAIL` | `list(map(string))` | `[]` | no | <pre>[<br>  {<br>    domain_name       = "academics.arjstack.in"<br>    validation_domain = "arjstack.in"<br>  }<br>] |
| <a name="validate_certificate"></a> [validate_certificate](#input\_validate\_certificate) | Flag to decide if Validation should be done. | `bool` | `true` | no |  |
| <a name="validation_records_fqdns"></a> [validation_records_fqdns](#input\_validation\_records\_fqdns) | Fully Qualified DNS if the DNS validation records are already exist and if `validation_method` is set `DNS`. | `list(string)` | `[]` | no |  |
| <a name="hosted_zone_id"></a> [hosted_zone_id](#input\_hosted\_zone\_id) | Hosted Zone Id | `string` | `null` | no |  |
| <a name="ttl"></a> [ttl](#input\_ttl) | The TTL of the record. | `number` | `60` | no |  |
| <a name="overwrite_records"></a> [overwrite_records](#input\_overwrite\_records) | Allow creation of this record in Terraform to overwrite an existing record, if any. | `bool` | `false` | no |  |
| <a name="tags"></a> [tags](#input\_tags) | A map of tags to assign to the certificate. | `map(string)` | `{}` | no |  |

### Outputs

| Name | Type | Description |
|:------|:------|:------|
| <a name="arn"></a> [arn](#output\_arn) | `string` | ARN of the certificate. |
| <a name="status"></a> [status](#output\_status) | `string` | Status of the certificate. |

### Authors

Module is maintained by [Ankit Jain](https://github.com/ankit-jn) with help from [these professional](https://github.com/ankit-jn/terraform-aws-acm/graphs/contributors).

