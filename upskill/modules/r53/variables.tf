variable "domain_name" {
  type        = string
  description = "Domain name used for r53 zone"
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain name added as a domain name prefix"
}

variable "lb_dns_name" {
  type        = string
  description = "Load balancer's dns name"
}

variable "lb_zone_id" {
  type        = string
  description = "Load balancer's zone id"
}
