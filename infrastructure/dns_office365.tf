resource "cloudflare_record" "autodiscover" {
  count   = var.env == "prd" ? 1 : 0

  zone_id = data.cloudflare_zone.domain.id
  name    = "autodiscover"
  content = "autodiscover.outlook.com"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "enterpriseenrollment" {
  count   = var.env == "prd" ? 1 : 0

  content = "enterpriseenrollment-s.manage.microsoft.com"
  name    = "enterpriseenrollment"
  proxied = false
  ttl     = 3600
  type    = "CNAME"
  zone_id = data.cloudflare_zone.domain.id
}

resource "cloudflare_record" "enterpriseregistration" {
  count   = var.env == "prd" ? 1 : 0

  content = "enterpriseregistration.windows.net"
  name    = "enterpriseregistration"
  proxied = false
  ttl     = 3600
  type    = "CNAME"
  zone_id = data.cloudflare_zone.domain.id
}

resource "cloudflare_record" "lyncdiscover" {
  count   = var.env == "prd" ? 1 : 0

  content = "webdir.online.lync.com"
  name    = "lyncdiscover"
  proxied = false
  ttl     = 3600
  type    = "CNAME"
  zone_id = data.cloudflare_zone.domain.id
}

resource "cloudflare_record" "sip" {
  count   = var.env == "prd" ? 1 : 0

  content = "sipdir.online.lync.com"
  name    = "sip"
  proxied = false
  ttl     = 3600
  type    = "CNAME"
  zone_id = data.cloudflare_zone.domain.id
}

resource "cloudflare_record" "mx_arkhamadvisorycom01emailprotectionoutlookcom" {
  count   = var.env == "prd" ? 1 : 0

  content  = "arkhamadvisory-com01e.mail.protection.outlook.com"
  name     = "arkham-advisory.com"
  priority = 0
  proxied  = false
  ttl      = 3600
  type     = "MX"
  zone_id  = data.cloudflare_zone.domain.id
}

resource "cloudflare_record" "sipfederationtls" {
  count   = var.env == "prd" ? 1 : 0

  name     = "_sipfederationtls._tcp"
  priority = 100
  proxied  = false
  ttl      = 3600
  type     = "SRV"
  zone_id  = data.cloudflare_zone.domain.id
  data {
    port     = 5061
    priority = 100
    target   = "sipfed.online.lync.com"
    weight   = 1
  }
}

resource "cloudflare_record" "sip_tls" {
  count   = var.env == "prd" ? 1 : 0

  name     = "_sip._tls"
  priority = 100
  proxied  = false
  ttl      = 3600
  type     = "SRV"
  zone_id  = data.cloudflare_zone.domain.id
  data {
    port     = 443
    priority = 100
    target   = "sipdir.online.lync.com"
    weight   = 1
  }
}

resource "cloudflare_record" "spf1" {
  count   = var.env == "prd" ? 1 : 0

  content = "\"v=spf1 include:spf.protection.outlook.com -all\""
  name    = "arkham-advisory.com"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  zone_id = data.cloudflare_zone.domain.id
}

resource "cloudflare_record" "ms_text_verification" {
  count   = var.env == "prd" ? 1 : 0

  content = "\"MS=ms13535738\""
  name    = "arkham-advisory.com"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  zone_id = data.cloudflare_zone.domain.id
}
