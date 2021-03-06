# REST API Setting
variable rest_do_uri { default  = "/mgmt/shared/declarative-onboarding" }
variable rest_as3_uri { default = "/mgmt/shared/appsvcs/declare" }
variable rest_do_method { default = "POST" }
variable rest_as3_method { default = "POST" }
variable rest_vm01_do_file {default = "vm01_do_data.json" }
variable rest_vm02_do_file {default = "vm02_do_data.json" }
variable rest_vm_as3_file {default = "vm_as3_data.json" }

# Azure Environment
variable "SP" {
	type = "map"
	default = {
		subscription_id = "c8bd4483-a1a2-47c4-acc8-4a49fbf180f3"
		client_id       = "e96adc75-ff1f-46a2-ae66-f2d311aca2d0"
		client_secret   = "B?os0m.vj*isKbu2rv=nJFOKiLLss8k2"
		tenant_id       = "e569f29e-b098-4cea-b6f0-48fa8532d64a"
	}
}
variable prefix	{ default = "dutchdemo" }
variable uname	{ default = "azureuser" }
variable upassword	{ default = "Default12345" }
variable location	{ default = "uksouth" }	 
variable region		{ default = "UK South" }

# NETWORK
variable cidr	{ default = "172.16.0.0/16" }
variable "subnets" {
	type = "map"
	default = {
		"subnet1" = "172.16.91.0/24"
		"subnet2" = "172.16.92.0/24"
		"subnet3" = "172.16.93.0/24"
	}
}
variable f5vm01mgmt	{ default = "172.16.91.4" }
variable f5vm01ext	{ default = "172.16.92.4" }
variable f5vm01ext_sec  { default = "172.16.92.11" }
variable f5vm02mgmt	{ default = "172.16.91.5" }
variable f5vm02ext	{ default = "172.16.92.5" }
variable f5vm02ext_sec  { default = "172.16.92.12" }
variable backend01ext   { default = "172.16.92.101" }

# BIGIP Image
variable instance_type	{ default = "Standard_DS4_v2" }
variable image_name	{ default = "f5-bigip-virtual-edition-25m-best-hourly" }
variable product	{ default = "f5-big-ip-best" }
variable bigip_version	{ default = "latest" }

# BIGIP Setup
variable license1	      { default = ""}
variable license2	      { default = ""}
variable host1_name           { default = "f5vm01"}
variable host2_name           { default = "f5vm02"}
variable dns_server           { default = "8.8.8.8" }
variable ntp_server           { default = "0.us.pool.ntp.org" }
variable timezone             { default = "UTC" }
## Please check and update the latest DO URL from https://github.com/F5Networks/f5-declarative-onboarding/releases
variable DO_onboard_URL	      { default = "https://github.com/garyluf5/f5tools/raw/master/f5-declarative-onboarding-1.3.0-4.noarch.rpm" }
## Please check and update the latest AS3 URL from https://github.com/F5Networks/f5-appsvcs-extension/releases/latest 
variable AS3_URL	      { default = "https://github.com/garyluf5/f5tools/raw/master/f5-appsvcs-3.9.0-3.noarch.rpm" }
variable libs_dir	      { default = "/config/cloud/azure/node_modules" }
variable onboard_log	      { default = "/var/log/startup-script.log" }

# TAGS
variable purpose        { default = "public"       }
variable environment    { default = "f5env"        }  #ex. dev/staging/prod
variable owner          { default = "f5owner"      }
variable group          { default = "f5group"      }
variable costcenter     { default = "f5costcenter" }
variable application    { default = "f5app"        }

variable vip_ip			{ default = "10.10.12.12" }
variable pool			{ default = "/Common/cambridge-pool" }