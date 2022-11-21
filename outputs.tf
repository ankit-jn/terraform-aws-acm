output "arn" {
    description = "ARN of the certificate"
    value = aws_acm_certificate.this.arn
}

output "status" {
    description = "Status of the certificate"
    value = aws_acm_certificate.this.status
}