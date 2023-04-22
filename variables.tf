# Location of the Intersight API Secretkey file
variable "secretkey" {
  default = "/root/secretkey.txt" 
}
# Intersight API-Key-ID
variable "apikey" {
  default = "63a1d2487564612d33eac892/63a1d2487564612d33eac896/642d55b47564613001e018ec"
}

variable "endpoint" {
  default = "https://www.intersight.com"
}
# Replace X with your POD number
variable "organization_name" {
  default = "default"
}

