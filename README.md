## Vault Agent with Docker Compose

This repo contains the source code for using Vault Agent with Docker Compose, as described in this [Medium blog post](https://medium.com/geekculture/using-vault-agent-with-docker-compose-f410d033026f?sk=abeeaf5f328c5d27d871e7b14024c59b). Please use the steps below to provision a Vault cluster and onboard an example application.

### Provision demo Vault cluster and application using Docker compose
Please clone the repository as below and cd into the project directory. Then run the `docker compose up` command as shown below:
```bash
git clone https://gitlab.com/kawsark/vault-agent-docker.git
cd vault-agent-docker
docker-compose up

# Run the included scripts
cd scripts/
./00-secrets.sh
./01-approle.sh
```

Access [http://localhost:8080](http://localhost:8080) on your browser, and you should be able to see the nginx application display a dynamic Postgres database credential provided by Vault as shown below. Also try accessing [http://localhost:8080/kv.html](http://localhost:8080/kv.html) to see example static secret values.

Please see the above blog post for a more details.

Optionally, if you prefer using the tool `make`, there is a *Makefile* included in the project directory root. Run make info to see the available targets.