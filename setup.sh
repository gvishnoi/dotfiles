#!/usr/bin/env bash
set -euo pipefail

echo "=== Gaurav Vishnoi's macOS Development Setup ==="

# 1) Ensure Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# 2) Load Homebrew shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3) Install all Homebrew packages from Brewfile (if exists)
if [ -f "$HOME/dotfiles/Brewfile" ]; then
  echo "Installing Homebrew packages from Brewfile (includes CLI tools, Docker Desktop, VS Code, Postman, etc.)..."
  brew bundle --file="$HOME/dotfiles/Brewfile"
else
  echo "No Brewfile found. Skipping."
fi

# 4) Symlink dotfiles
echo "Linking dotfiles..."
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.zprofile" "$HOME/.zprofile"
ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/.gitignore_global" "$HOME/.gitignore_global"
[ -f "$HOME/dotfiles/.p10k.zsh" ] && ln -sf "$HOME/dotfiles/.p10k.zsh" "$HOME/.p10k.zsh"

# 5) Install Java via SDKMAN! and Maven/Gradle
if [ ! -d "$HOME/.sdkman" ]; then
  echo "Installing SDKMAN!..."
  curl -s "https://get.sdkman.io" | bash
fi
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  # shellcheck disable=SC1091
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  echo "Installing Java 17 (Temurin), Maven, Gradle via SDKMAN!..."
  sdk install java 17.0.11-tem || true
  sdk default java 17.0.11-tem || true
  sdk install maven || true
  sdk install gradle || true
else
  echo "WARNING: SDKMAN init script not found; skipping Java toolchain."
fi

# 6) Install Python version via pyenv
if command -v pyenv >/dev/null 2>&1; then
  echo "Installing Python 3.12.4 via pyenv..."
  pyenv install -s 3.12.4
  pyenv global 3.12.4
else
  echo "pyenv not found. Skipping Python installation."
fi

# 7) Restore Python packages
if [ -f "$HOME/dotfiles/python-requirements.txt" ]; then
  echo "Installing Python packages from requirements.txt..."
  python -m pip install --upgrade pip
  python -m pip install -r "$HOME/dotfiles/python-requirements.txt"
else
  echo "No python-requirements.txt found. Skipping."
fi

# 8) Restore VS Code extensions
if command -v code >/dev/null 2>&1 && [ -f "$HOME/dotfiles/vscode-extensions.txt" ]; then
  echo "Installing VS Code extensions..."
  xargs -n 1 code --install-extension < "$HOME/dotfiles/vscode-extensions.txt" || true
else
  echo "VS Code or extensions list not found. Skipping."
fi

# 9) Install Databricks CLI via pipx
if command -v pipx >/dev/null 2>&1; then
  echo "Ensuring ~/.local/bin on PATH..."
  pipx ensurepath || true
  if ! command -v databricks >/dev/null 2>&1; then
    echo "Installing Databricks CLI via pipx..."
    pipx install databricks-cli || true
  fi
else
  echo "pipx not found. Skipping Databricks CLI installation."
fi

# 10) Optional: start Docker services (Postgres, pgAdmin, Redis) with user consent
SERVICES_DIR="$HOME/dev/services"
COMPOSE_FILE="$SERVICES_DIR/compose.yml"
if [ -f "$COMPOSE_FILE" ]; then
  echo ""
  read -r -p "Start local dev services now (Postgres, pgAdmin, Redis)? [y/N]: " START_SERVICES
  if [[ "${START_SERVICES:-N}" =~ ^[Yy]$ ]]; then
    # Ensure Docker CLI exists
    if ! command -v docker >/dev/null 2>&1; then
      echo "Docker CLI not found. Install Docker Desktop via Homebrew first."
    else
      # Try to start Docker Desktop (macOS) if daemon not ready
      if ! docker info >/dev/null 2>&1; then
        echo "Starting Docker Desktop..."
        open -a Docker || true
        echo "Waiting for Docker to become ready..."
        for i in {1..60}; do
          if docker info >/dev/null 2>&1; then
            echo "Docker is ready."
            break
          fi
          sleep 2
        done
      fi

      if docker info >/dev/null 2>&1; then
        echo "Bringing up services from $COMPOSE_FILE ..."
        pushd "$SERVICES_DIR" >/dev/null
        if [ -f "Makefile" ] && grep -qE '^[[:alnum:]_-]+:.*' Makefile; then
          make up || docker compose up -d
        else
          docker compose up -d
        fi
        popd >/dev/null
      else
        echo "Docker did not become ready. You can start services later with:"
        echo "  cd \"$SERVICES_DIR\" && docker compose up -d"
      fi
    fi
  else
    echo "Skipping service startup."
  fi
else
  echo "No services compose file found at $COMPOSE_FILE. Skipping service startup."
fi

# 11) Post-install health check (optional, non-fatal)
echo "Running post-install checks (make doctor)..."
if command -v make >/dev/null 2>&1; then
  make -C "$HOME/dotfiles" doctor || true
else
  echo "make not found; skipping doctor checks."
fi

echo ""
echo "=== Setup complete! Please restart your terminal or run 'source ~/.zshrc' ==="
