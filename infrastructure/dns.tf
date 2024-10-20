data "cloudflare_zone" "domain" {
  name = "arkham-advisory.com"
}

resource "cloudflare_record" "cname_website" {
  count   = var.env == "prd" ? 1 : 0

  zone_id = data.cloudflare_zone.domain.id
  name    = "arkham-advisory.com"
  content = "arkham-advisory.github.io"
  type    = "CNAME"
  proxied = false
}

