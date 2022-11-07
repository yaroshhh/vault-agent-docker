# Vault Agent with Docker Compose

This repo contains the source code for using Vault Agent with Docker Compose, as described in this [Medium blog post](https://medium.com/geekculture/using-vault-agent-with-docker-compose-f410d033026f?sk=abeeaf5f328c5d27d871e7b14024c59b). Please use the steps below to provision a Vault cluster and onboard an example application.

# Provision demo Vault cluster and application using Docker compose

## Requerments
- Linux OS (UBUNTU 18.04 is recomended)
- [Docker](https://docs.docker.com/desktop/install/ubuntu/) (latest version)
- [Hashicorf Vault](https://developer.hashicorp.com/vault/docs/install) (latest version)
- [postgresql-client-12](https://www.postgresql.org/download/linux/ubuntu/#footer) (A client for PostgreSQL)
- [jq](https://lindevs.com/install-jq-on-ubuntu) (JSON processing tool)

## Instructions
- Please clone the repository as below and cd into the project directory. Then run the `sh ./scripts/build.sh` command as shown below:
    ```bash
    git clone https://gitlab.com/kawsark/vault-agent-docker.git
    cd vault-agent-docker
    sh ./scripts/build.sh
    ```

- Access [http://localhost:8080](http://localhost:8080) on your browser, and you should be able to see the nginx application display a dynamic Postgres database credential provided by Vault as shown below. Also try accessing [http://localhost:8080/kv.html](http://localhost:8080/kv.html) to see example static secret values.

- You can access Vault Agent UI through [http://localhost:8200/](http://localhost:8200/)

* Optionally, if you prefer using the tool `make`, there is a *Makefile* included in the project directory root. Run make info to see the available targets.