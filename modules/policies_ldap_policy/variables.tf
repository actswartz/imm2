#____________________________________________________________
#
# LDAP Policy Variables Section.
#____________________________________________________________

variable "description" {
  default     = ""
  description = "Description for the Policy."
  type        = string
}

variable "enabled" {
  default     = true
  description = "Flag to Enable or Disable the Policy."
  type        = bool
}

variable "name" {
  default     = "ldap_policy"
  description = "Name for the Policy."
  type        = string
}

variable "ldap_servers" {
  default     = ["time-a-g.nist.gov", "time-b-g.nist.gov"]
  description = "List of LDAP Servers to Assign to the Policy."
  type        = list(string)
}

variable "org_moid" {
  description = "Intersight Organization moid."
  type        = string
}

variable "profiles" {
  default     = []
  description = "List of Profiles to Assign to the Policy."
  type        = list(map(string))
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}

variable "timezone" {
  default     = "America/New_York"
  description = "Timezone to Assign to the Policy."
  type        = string
}

#____________________________________________________________
#
# List of Supported Timezones.
#____________________________________________________________

/* List of Supported Timezones
  Africa/Abidjan
  Africa/Accra
  Africa/Algiers
  Africa/Bissau
  Africa/Cairo
  Africa/Casablanca
  Africa/Ceuta
  Africa/El_Aaiun
  Africa/Johannesburg
  Africa/Khartoum
  Africa/Lagos
  Africa/Maputo
  Africa/Monrovia
  Africa/Nairobi
  Africa/Ndjamena
  Africa/Tripoli
  Africa/Tunis
  Africa/Windhoek
  America/Anchorage
  America/Araguaina
  America/Argentina/Buenos_Aires
  America/Asuncion
  America/Bahia
  America/Barbados
  America/Belem
  America/Belize
  America/Boa_Vista
  America/Bogota
  America/Campo_Grande
  America/Cancun
  America/Caracas
  America/Cayenne
  America/Cayman
  America/Chicago
  America/Costa_Rica
  America/Cuiaba
  America/Curacao
  America/Danmarkshavn
  America/Dawson_Creek
  America/Denver
  America/Edmonton
  America/El_Salvador
  America/Fortaleza
  America/Godthab
  America/Grand_Turk
  America/Guatemala
  America/Guayaquil
  America/Guyana
  America/Halifax
  America/Havana
  America/Hermosillo
  America/Iqaluit
  America/Jamaica
  America/La_Paz
  America/Lima
  America/Los_Angeles
  America/Maceio
  America/Managua
  America/Manaus
  America/Martinique
  America/Mazatlan
  America/Mexico_City
  America/Miquelon
  America/Montevideo
  America/Nassau
  America/New_York
  America/Noronha
  America/Panama
  America/Paramaribo
  America/Phoenix
  America/Port_of_Spain
  America/Port-au-Prince
  America/Porto_Velho
  America/Puerto_Rico
  America/Recife
  America/Regina
  America/Rio_Branco
  America/Santiago
  America/Santo_Domingo
  America/Sao_Paulo
  America/Scoresbysund
  America/St_Johns
  America/Tegucigalpa
  America/Thule
  America/Tijuana
  America/Toronto
  America/Vancouver
  America/Whitehorse
  America/Winnipeg
  America/Yellowknife
  Antarctica/Casey
  Antarctica/Davis
  Antarctica/DumontDUrville
  Antarctica/Mawson
  Antarctica/Palmer
  Antarctica/Rothera
  Antarctica/Syowa
  Antarctica/Vostok
  Asia/Almaty
  Asia/Amman
  Asia/Aqtau
  Asia/Aqtobe
  Asia/Ashgabat
  Asia/Baghdad
  Asia/Baku
  Asia/Bangkok
  Asia/Beirut
  Asia/Bishkek
  Asia/Brunei
  Asia/Calcutta
  Asia/Choibalsan
  Asia/Colombo
  Asia/Damascus
  Asia/Dhaka
  Asia/Dili
  Asia/Dubai
  Asia/Dushanbe
  Asia/Gaza
  Asia/Hong_Kong
  Asia/Hovd
  Asia/Irkutsk
  Asia/Jakarta
  Asia/Jayapura
  Asia/Jerusalem
  Asia/Kabul
  Asia/Kamchatka
  Asia/Karachi
  Asia/Katmandu
  Asia/Kolkata
  Asia/Krasnoyarsk
  Asia/Kuala_Lumpur
  Asia/Macau
  Asia/Magadan
  Asia/Makassar
  Asia/Manila
  Asia/Nicosia
  Asia/Omsk
  Asia/Pyongyang
  Asia/Qatar
  Asia/Rangoon
  Asia/Riyadh
  Asia/Saigon
  Asia/Seoul
  Asia/Shanghai
  Asia/Singapore
  Asia/Taipei
  Asia/Tashkent
  Asia/Tbilisi
  Asia/Tehran
  Asia/Thimphu
  Asia/Tokyo
  Asia/Ulaanbaatar
  Asia/Vladivostok
  Asia/Yakutsk
  Asia/Yekaterinburg
  Asia/Yerevan
  Atlantic/Azores
  Atlantic/Bermuda
  Atlantic/Canary
  Atlantic/Cape_Verde
  Atlantic/Faroe
  Atlantic/Reykjavik
  Atlantic/South_Georgia
  Atlantic/Stanley
  Australia/Adelaide
  Australia/Brisbane
  Australia/Darwin
  Australia/Hobart
  Australia/Perth
  Australia/Sydney
  Etc/GMT
  Europe/Amsterdam
  Europe/Andorra
  Europe/Athens
  Europe/Belgrade
  Europe/Berlin
  Europe/Brussels
  Europe/Bucharest
  Europe/Budapest
  Europe/Chisinau
  Europe/Copenhagen
  Europe/Dublin
  Europe/Gibraltar
  Europe/Helsinki
  Europe/Istanbul
  Europe/Kaliningrad
  Europe/Kiev
  Europe/Lisbon
  Europe/London
  Europe/Luxembourg
  Europe/Madrid
  Europe/Malta
  Europe/Minsk
  Europe/Monaco
  Europe/Moscow
  Europe/Oslo
  Europe/Paris
  Europe/Prague
  Europe/Riga
  Europe/Rome
  Europe/Samara
  Europe/Sofia
  Europe/Stockholm
  Europe/Tallinn
  Europe/Tirane
  Europe/Vienna
  Europe/Vilnius
  Europe/Warsaw
  Europe/Zurich
  Indian/Chagos
  Indian/Christmas
  Indian/Cocos
  Indian/Kerguelen
  Indian/Mahe
  Indian/Maldives
  Indian/Mauritius
  Indian/Reunion
  Pacific/Apia
  Pacific/Auckland
  Pacific/Chuuk
  Pacific/Easter
  Pacific/Efate
  Pacific/Enderbury
  Pacific/Fakaofo
  Pacific/Fiji
  Pacific/Funafuti
  Pacific/Galapagos
  Pacific/Gambier
  Pacific/Guadalcanal
  Pacific/Guam
  Pacific/Honolulu
  Pacific/Kiritimati
  Pacific/Kosrae
  Pacific/Kwajalein
  Pacific/Majuro
  Pacific/Marquesas
  Pacific/Nauru
  Pacific/Niue
  Pacific/Norfolk
  Pacific/Noumea
  Pacific/Pago_Pago
  Pacific/Palau
  Pacific/Pitcairn
  Pacific/Pohnpei
  Pacific/Port_Moresby
  Pacific/Rarotonga
  Pacific/Tahiti
  Pacific/Tarawa
  Pacific/Tongatapu
  Pacific/Wake
  Pacific/Wallis
*/
