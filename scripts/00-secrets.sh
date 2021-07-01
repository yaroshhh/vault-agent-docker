#!/bin/bash

# Setup VAULT_ADDR and VAULT_TOKEN
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

# Determine policy path
if [[ -f "./nginx.hcl" ]]; then
  policy_file=./nginx.hcl
else
  policy_file=../nginx.hcl
fi

# Write a Policy
vault policy write nginx ${policy_file}

# Enable the kv Secrets engine and store a secret
vault secrets enable -version=2 kv
vault kv put kv/nginx/static app=nginx username=nginx password=sup4s3cr3t

# Enable the postgres Secrets Engine 
vault secrets enable -path=postgres database
vault write postgres/config/products \
    plugin_name=postgresql-database-plugin \
    allowed_roles="*" \
    connection_url="postgresql://{{username}}:{{password}}@db:5432?sslmode=disable" \
    username="postgres" \
    password="password"

# Create a Role for nginx
vault write postgres/roles/nginx \
  db_name=products \
  creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
  GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\"" \
  default_ttl="30s" \
  max_ttl="24h"