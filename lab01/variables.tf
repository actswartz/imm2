# Location of the Intersight API Secretkey file
variable "secretkey" {
  default = "/home/student/secretkey.txt" 
}
# Intersight API-Key-ID
variable "apikey" {
  default = "PUT_YOUR_API_KEY_HERE"
}

variable "endpoint" {
  default = "https://www.intersight.com"
}
# Replace X with your POD number
variable "organization_name" {
  default = "default"
}

