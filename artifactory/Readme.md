# Usage

### To Start artifcatory
`docker-compose -p rt up -d`

### To Stop
`docker-compose -p rt down`

### To Update EULA
`./accept-eula.sh`

### Generating SSL certs with SAN
Create req.conf with
```
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no
[req_distinguished_name]
C = US
ST = TX
L = Dallas
O = local
OU = local
CN = localhost
[v3_req]
keyUsage = nonRepudiation, digitalSignature, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = localhost
IP.1 = 192.168.1.209
IP.2 = 127.0.0.1
```

Run
`openssl req -x509 -nodes -days 730 -newkey rsa:4096 -keyout example.key -out example.crt -config req.conf -extensions 'v3_req'`

Add Cert to Mac Trusted CA List
`sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain example.crt`

### Certs Update
You may need to copy certs into ssl folder as example.crt and example.key if you ever delete artifactory_data and reinitiated docker-compose
