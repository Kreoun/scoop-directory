# Makefile

SCOOP_SCHEMA_JSON=https://raw.githubusercontent.com/ScoopInstaller/Scoop/948daa0c63515be986743c40933cc1bb84ab776e/schema.json
# SCOOP_SCHEMA_JSON=https://raw.githubusercontent.com/ScoopInstaller/Scoop/master/schema.json

all: help

add:
	git remote add -f spdx/license-list-data https://github.com/spdx/license-list-data
	git subtree add --prefix vendor/spdx/license-list-data spdx/license-list-data master --squash

pull:
	git fetch spdx/license-list-data master
	git subtree pull --prefix vendor/spdx/license-list-data spdx/license-list-data master --squash

update:
	-mkdir -p vendor/ScoopInstaller/Scoop
	wget -O vendor/ScoopInstaller/Scoop/schema.json $(SCOOP_SCHEMA_JSON)

help:
	@echo 'add:    Add vendor subtrees'
	@echo 'pull:   Pull vendor subtree changes'
	@echo 'update: Download vendor updates'