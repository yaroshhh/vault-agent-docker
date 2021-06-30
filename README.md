## Vault Agent with Docker Compose

This repo contains the source code for using Vault Agent with Docker Compose, as described in this [blog post (pending)](pending). Please use the steps below to provision a Vault cluster and onboard an example application.

### Provision demo Vault cluster and application using Docker compose
Please clone the repository as below and cd into the project directory. Then run the `docker compose up` command as shown below:
```bash
git clone https://gitlab.com/kawsark/vault-agent-docker.git
cd docker-compose/ && docker compose up
```

Optionally, if you prefer using the tool `make`, there is a *Makefile* included in the project directory root. Run make info to see the available targets.