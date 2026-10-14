#!/bin/sh
# Regenerate PUBLIC TEST-ONLY credentials. Never use these keys or CAs outside tests.
# Requires OpenSSL only for regeneration; running mix test requires no external tools.
set -eu
fixture_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fixture_tmp=$(mktemp -d)
trap 'rm -rf "$fixture_tmp"' EXIT HUP INT TERM
cd "$fixture_tmp"
cat > ca.cnf <<'CONFIG'
[req]
distinguished_name = dn
[dn]
[ca]
basicConstraints = critical,CA:TRUE
keyUsage = critical,keyCertSign,cRLSign
subjectKeyIdentifier = hash
CONFIG
for ca in trusted untrusted; do
  openssl req -new -x509 -newkey rsa:2048 -nodes -days 3650 \
    -subj "/CN=PUBLIC TEST ONLY $ca CA" -config ca.cnf -extensions ca \
    -keyout "$ca-key.pem" -out "$ca-ca.pem"
done
cat > server.cnf <<'CONFIG'
basicConstraints = critical,CA:FALSE
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = DNS:control-plane.test
CONFIG
cat > client.cnf <<'CONFIG'
basicConstraints = critical,CA:FALSE
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = clientAuth
subjectAltName = DNS:client.test
CONFIG
mkdir signed
: > index.txt
printf '1000\n' > serial
cat > signer.cnf <<'CONFIG'
[ca]
default_ca = signing
[signing]
database = index.txt
serial = serial
new_certs_dir = signed
certificate = trusted-ca.pem
private_key = trusted-key.pem
default_md = sha256
policy = policy
[policy]
commonName = supplied
CONFIG
for name in server client untrusted-client expired-client expired-server; do
  ca=trusted
  kind=client
  days=3650
  case "$name" in
    *server) kind=server ;;
  esac
  case "$name" in
    untrusted-*) ca=untrusted ;;
    expired-*) days=-1 ;;
  esac
  openssl req -new -newkey rsa:2048 -nodes -subj "/CN=PUBLIC TEST ONLY $name" \
    -keyout "$name-key.pem" -out "$name.csr"
  if [ "$days" = -1 ]; then
    openssl ca -batch -config signer.cnf -in "$name.csr" -extfile "$kind.cnf" \
      -startdate 200101000000Z -enddate 210101000000Z -notext -out "$name-cert.pem"
  else
    openssl x509 -req -in "$name.csr" -CA "$ca-ca.pem" -CAkey "$ca-key.pem" \
      -CAcreateserial -days "$days" -extfile "$kind.cnf" -out "$name-cert.pem"
  fi
done
for file in trusted-ca.pem untrusted-ca.pem *-cert.pem server-key.pem client-key.pem untrusted-client-key.pem expired-client-key.pem expired-server-key.pem; do
  { printf '%s\n' '# PUBLIC TEST FIXTURE ONLY: never use this certificate/key in production.'; cat "$file"; } > "$fixture_dir/$file"
done
# CA signing keys are deliberately discarded with the temporary directory.
