#!/usr/bin/make -f

.PHONY: runcli
runcli: date
	docker compose run -it --rm --remove-orphans sandbox sh

.PHONY: rebuild
rebuild: date
	docker compose build sandbox

.PHONY: rootcli
rootcli: date
	docker compose run -itu root --rm --remove-orphans sandbox sh

.PHONY: stop
stop:
	docker compose down

.PHONY: date
date:
	@date
