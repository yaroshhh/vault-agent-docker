#!/bin/bash

# Setup VAULT_ADDR and VAULT_TOKEN
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

# Enable AppRole and create a role:
vault auth enable approle
vault write auth/approle/role/nginx token_policies="nginx"

# Determine vault-agent path
if [ -d "./vault-agent" ]; then
  vault_agent_dir=./vault-agent
else
  vault_agent_dir=../vault-agent
fi

# Write out a Role ID and Secret ID
vault read -format=json auth/approle/role/nginx/role-id \
  | jq -r '.data.role_id' > ${vault_agent_dir}/nginx-role_id
vault write -format=json -f auth/approle/role/nginx/secret-id \
  | jq -r '.data.secret_id' > ${vault_agent_dir}/nginx-secret_id

# Restart the vault-agent-demo container
docker restart vault-agent-demo
