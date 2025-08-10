# Troubleshooting Guide

Common issues and fixes from past setups.

---

## 1. nvm (Node Version Manager) not loading
**Symptoms:**
- `nvm: command not found`
- `node` / `npm` not available

**Fix:**
Add this block to `~/.zshrc` (or ensure it exists in `~/dotfiles/.zshrc`):
```sh
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
```
Reload:
```sh
source ~/.zshrc
```

---

## 2. pyenv not found
**Symptoms:**
- `pyenv: command not found`
- Python version not as expected

**Fix:**
Ensure pyenv is installed via Homebrew:
```sh
brew install pyenv pyenv-virtualenv
```
Add init to `.zshrc`:
```sh
command -v pyenv >/dev/null && eval "$(pyenv init -)"
command -v pyenv >/dev/null && eval "$(pyenv virtualenv-init -)"
```
Reload:
```sh
source ~/.zshrc
```

---

## 3. Makefile "missing separator" error
**Symptoms:**
- Error: `missing separator`

**Fix:**
Make sure command lines in Makefile start with **tabs**, not spaces.

---

## 4. Docker Compose .env file errors
**Symptoms:**
- `unexpected character ">"`
- Variables not set

**Fix:**
Ensure `.env` contains only `KEY=VALUE` pairs. Example:
```env
POSTGRES_VERSION=16
REDIS_VERSION=7
PGUSER=dev
PGPASSWORD=devpass
PGDB=devdb
PGADMIN_EMAIL=dev@example.com
PGADMIN_PASSWORD=adminpass
```

No extra lines like `cat > ... <<'EOF'` or `EOF`.
