terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}


provider "cloudflare" {
  email   = "sleptsovilya@gmail.com"
  api_key = "f106878cb2904700e01b39f17788655db0684"
}

resource "cloudflare_record" "root_isd_pp_ua" {
  zone_id   = var.zone_id
  name      = "@"
  value     = aws_lb.Balancer.dns_name
  type      = "CNAME"
  proxied   = true
  ttl       = 1
  depends_on = [aws_lb.Balancer]
}

# CNAME for WWW subdomain.

resource "cloudflare_record" "www-isd-pp-ua" {
  # zone_id   = "${cloudflare_zone.misha-krik-pp-ua.id}"
  zone_id   = var.zone_id
  name      = "www"
  value     = aws_lb.Balancer.dns_name
  type      = "CNAME"
  proxied   = true
  ttl       = 1
  depends_on = [aws_lb.Balancer]
}



#terraform {
#  required_providers {
#    cloudflare = {
#      source  = "cloudflare/cloudflare"
#      version = "~> 3.0"
#    }
#  }
#}
#
#
#provider "cloudflare" {
#  email   = "sleptsovilya@gmail.com"
#  api_key = "f106878cb2904700e01b39f17788655db0684"
#}
#
#
#resource "cloudflare_record" "CNAME" {
#  zone_id = var.zone_id
#  name    = "CNAME"
#  value   = data.aws_lb.lb_dns_name.dns_name
#  type    = "CNAME"
#  proxied = true
#  #depends_on = [aws_lb.Balancer]
#}
#
#resource "cloudflare_record" "WWW" {
#  zone_id = var.zone_id
#  name    = "WWW"
#  value   = data.aws_lb.lb_dns_name.dns_name
#  type    = "CNAME"
#  proxied = true
#  #depends_on = [aws_lb.Balancer]
#}