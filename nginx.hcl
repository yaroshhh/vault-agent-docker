# This policy allows the nginx app to access Key/Value and Database Secrets engine

# List, create, update, and delete key/value secrets
path "kv/data/nginx/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Read dynamic database secrets
path "postgres/creds/nginx"
{
  capabilities = ["read"]
}
