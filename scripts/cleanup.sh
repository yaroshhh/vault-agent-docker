#!/bin/bash

# This script will clean up locally provisioned resources
[[ ! -f "./scripts" ]] && cd ../

docker compose down
rm -f ./vault-agent/*role_id
rm -f ./vault-agent/*secret_id
rm -f ./vault-agent/token
rm -f ./nginx/index.html
rm -f ./nginx/kv.html