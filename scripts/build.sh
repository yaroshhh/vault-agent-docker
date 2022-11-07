[ ! -f "./docker-compose.yml" ] && cd ../
echo "!! Running cleanup script..."
sh ./scripts/cleanup.sh
echo "!! Running docker compose..."
docker-compose up -d
sleep 3
echo "!! Running secret script..."
export PGPASSWORD="password"
db_params="-U postgres \
-h localhost \
-p 15432 \
products"
sql_file=startup.sql
psql --echo-all ${db_params} -f ${sql_file}
sh ./scripts/00-secrets.sh
sleep 1
echo "!! Running approle script..."
sh ./scripts/01-approle.sh