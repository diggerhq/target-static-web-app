# target-static-web-app

template parameters:

{
    "app_name": ?????,
    "environment": ??????,
    "aws_key": aws key for account where aws resources are going to be created,
    "aws_secret": aws secret for the key above,
    "dggr_aws_key": aws key for aws account where dggr domain/certificate are going to be created,
    "dggr_aws_secret": aws secret for the key above 
    "region": region where aws resources will be created,
    "environment_config": {
        "use_dggr_domain": whether to use dggr domain or user's domain
        "hostname": user's provided hostname if user's domain is being used
        "acm_certificate_arn_virginia": certificate arn for custom user's domain
        "dns_zone_id": if user is using route53 and his own domain then it's hosted zone id of custom domain
        "dggr_hostname": digger domain if dggr domain is being used, for example : "diggerdev.xyz",
        "dggr_zone_id": hosted zone id for dggr domain
        "dggr_acm_certificate_arn_virginia": certificate arn for dggr domain, if dggr domain is being used
    },
    "services": {
        "reactapp": {
            "service_name": "reactapp",
            "service_type": "webapp" is only option
            "website_domain": subdomain if user's domain is being used
        },
    },
}

terraform resources to be created:

resource "aws_s3_bucket" "{{service_name}}_website_logs"
resource "aws_s3_bucket_acl" "{{service_name}}_website_logs_acl"
resource "aws_s3_bucket" "{{service_name}}_website_root"
resource "aws_s3_bucket_logging" "{{service_name}}_website_root_logging"
resource "aws_s3_bucket_acl" "{{service_name}}_website_root_acl"
resource "aws_cloudfront_distribution" "{{service_name}}_website_cdn_root"
resource "aws_route53_record" "{{service_name}}_website_cdn_root_record"
resource "aws_route53_record" "{{service_name}}_dggr_website_cdn_root_record"
resource "aws_s3_bucket_policy" "{{service_name}}_update_website_root_bucket_policy"