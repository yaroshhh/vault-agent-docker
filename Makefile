.DEFAULT_GOAL := info

all: clean up-detach init approle

.PHONY: clean up up-detach init approle info admin ip

info:
	$(info Targets are: all, up, up-detach, init, approle, clean. Run all to execute them in order.)
	$(info up will block and docker compose in foreground, up-detach will run docker compose in background.)

admin:
	$(info this target will create an admin policy. Note: the root token needs to be set with the VAULT_TOKEN environment variable)
	export VAULT_ADDR=http://localhost:8200 \
	  && vault policy write learn-admin admin-policy.hcl \
	  && vault token create -policy=learn-admin
	$(info **please export the above token as part as the VAULT_TOKEN environment variable**)

up:
	docker compose up

up-detach:
	docker compose up --detach

init:
	cd scripts && ./00-secrets.sh

approle:
	cd scripts && ./01-approle.sh

all-in-one scripts bundle:
	sh ./scripts/build.sh

cache:
	echo "Testing cache"
	export VAULT_ADDR=http://localhost:18200 \
	  && vault kv get kv/nginx/static

clean:
	docker compose down
	rm -f vault-agent/*role_id
	rm -f vault-agent/*secret_id
	rm -f vault-agent/login.json
	rm -f vault-agent/token
	rm -f nginx/index.html
	rm -f nginx/kv.html
	