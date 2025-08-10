# Utility Makefile for quick checks and helpers

.PHONY: doctor services-up services-down services-logs

doctor:
	@echo "== Checking Homebrew =="
	@command -v brew >/dev/null || (echo "Missing: brew" && exit 1)
	@brew --version >/dev/null || (echo "Brew issue" && exit 1)
	@echo "== Checking SDKMAN & Java =="
	@test -s "$(HOME)/.sdkman/bin/sdkman-init.sh" || echo "SDKMAN not found; Java via SDKMAN may be missing"
	@java -version >/dev/null 2>&1 || echo "Missing: java"
	@mvn -v >/dev/null 2>&1 || echo "Missing: maven"
	@gradle -v >/dev/null 2>&1 || echo "Missing: gradle"
	@echo "== Checking pyenv & Python =="
	@command -v pyenv >/dev/null || echo "Missing: pyenv"
	@python -V >/dev/null 2>&1 || echo "Missing: python (activate pyenv)"
	@echo "== Checking nvm & Node =="
	@command -v nvm >/dev/null || echo "Missing: nvm (check .zshrc block)"
	@node -v >/dev/null 2>&1 || echo "Missing: node"
	@npm -v >/dev/null 2>&1 || echo "Missing: npm"
	@echo "== Checking Docker =="
	@command -v docker >/dev/null || echo "Missing: docker"
	@docker info >/dev/null 2>&1 || echo "Docker not running"
	@echo "== Checking Cloud CLIs =="
	@aws --version >/dev/null 2>&1 || echo "Missing: awscli"
	@az version >/dev/null 2>&1 || echo "Missing: azure-cli"
	@gcloud --version >/dev/null 2>&1 || echo "Missing: google-cloud-sdk"
	@databricks --version >/dev/null 2>&1 || echo "Missing: databricks CLI"
	@echo "== Done. If any 'Missing:' lines appeared, fix per README."

services-up:
	cd $(HOME)/dev/services && docker compose up -d

services-down:
	cd $(HOME)/dev/services && docker compose down

services-logs:
	cd $(HOME)/dev/services && docker compose logs -f
