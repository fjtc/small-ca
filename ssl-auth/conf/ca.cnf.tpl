[ ca ]
default_ca = CA_default

[ CA_default ]
# The CA files and directories. Do not change it manually or the scripts will
# no longer work.
dir               = KTILbq5XWRl7RwAtwpHq
certs             = $dir/certs
crl_dir           = $dir/crl
new_certs_dir     = $dir/db/certs
database          = $dir/db/index.txt
serial            = $dir/db/serial.txt
RANDFILE          = $dir/private/.rand

private_key       = $dir/private/cakey.pem
certificate       = $dir/certs/cacert.pem

# CRL parameters
crlnumber         = $dir/db/crlnumber.txt	
crl               = $dir/crl/ca.crl
crl_extensions    = crl_ext

default_crl_days  = 365
default_md        = sha256
name_opt          = ca_default
cert_opt          = ca_default
default_days      = 3650
preserve          = no
policy            = policy_any
unique_subject    = no

[ policy_any ]
countryName             = optional
stateOrProvinceName     = optional
localityName            = optional
organizationName        = optional
organizationalUnitName  = optional
commonName              = optional
emailAddress            = optional

[ req ]
default_bits        = 2048
distinguished_name  = req_distinguished_name
string_mask         = utf8only

[ req_distinguished_name ]
countryName                     = Country Name (2 letter code)
stateOrProvinceName             = State or Province Name
localityName                    = Locality Name
organizationName                = Organization Name
organizationalUnitName          = Organizational Unit Name
commonName                      = Common Name
emailAddress                    = Email Address
# Default values
countryName_default             = BR
stateOrProvinceName_default     = Sao Paulo
localityName_default            = Sao Paulo
organizationName_default        = ACME Corporation
organizationalUnitName_default  = Research and Development
emailAddress_default            =

[ v3_ca ]
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true, pathlen:0
keyUsage = critical, digitalSignature, cRLSign, keyCertSign
# crlDistributionPoints=URI:http://www.brokenbits.com.br/pki/cert.crl

[ usr_cert ]
basicConstraints = CA:FALSE
nsCertType = client, email
nsComment = "OpenSSL Generated Client Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth, emailProtection
basicConstraints = CA:false, pathlen:1

[ server_cert ]
basicConstraints = CA:FALSE
nsCertType = server
nsComment = "OpenSSL Generated Server Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer:always
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
basicConstraints = CA:false, pathlen:1

[ crl_ext ]
authorityKeyIdentifier=keyid:always

