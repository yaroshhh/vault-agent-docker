{{ with secret "postgres/creds/nginx" -}}
#!/bin/bash

# Setup PGPASSWORD and PGUSER
export PGPASSWORD="{{ .Data.password }}"
export PGUSER="{{ .Data.username }}"

# Locate sql file
if [ -d "./scripts" ]; then
  sql_file=./scripts/test.sql
else
  sql_file=../scripts/test.sql
fi

# Setup DB address
# postgresql://{{ .Data.username }}:{{ .Data.password }}@db:5432/product?sslmode=disable
db_params="-U {{ .Data.username }} \
-h localhost \
-p 15432 \
products"

# Setup commnad for execute
psql_cmd="psql ${db_params} -f ${sql_file}"

#Run
echo "CMD: ${psql_cmd}"
echo "====================================================="
$psql_cmd

{{- end }}