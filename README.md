# Gaurav Vishnoi's macOS Development Setup

This repository contains my **macOS development environment configuration** — including shell setup, programming language managers, databases, cloud SDKs, IDE settings, and data science tools — all tracked in version control for a **tidy, reproducible setup**.

---

## 🚀 Initial Setup on a Fresh Mac

### 1. Install Xcode Command Line Tools
```sh
xcode-select --install
```

### 2. Install Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. Clone Dotfiles
```sh
git clone git@github.com:<your-username>/dotfiles.git ~/dotfiles
```

### 4. Run Setup Script
```sh
cd ~/dotfiles
./setup.sh
```

---

## 📦 What’s Included

### 🖥 Shell & Terminal
- **Zsh** with **Oh My Zsh**
- **Powerlevel10k** theme with custom `.p10k.zsh`
- Handy aliases and completions

### 💻 Programming Languages
- **Node.js** via nvm (LTS default)
- **Python 3.12.4** via pyenv + pyenv-virtualenv
- **Java 17.0.11 (Temurin)** via SDKMAN! (default)
- Maven, Gradle
- Optional: Go, Rust

### 🛠 Core CLI Tools
- `git`, `gh` (GitHub CLI), `tree`, `jq`, `yq`, `httpie`, `fzf`, `htop`

### 🗄 Databases & Services (via Docker Compose)
- PostgreSQL
- pgAdmin
- Redis
- Makefile commands for easy up/down/logs

### 🛠 Developer Tools
- **Docker Desktop**
- **Kubernetes**: kubectl, helm, k9s, stern
- **IaC & Pipelines**: Terraform, OpenTofu, act
- **Cloud CLIs**:
  - AWS CLI
  - Azure CLI
  - Google Cloud SDK
  - Databricks CLI (`databricks-cli` via pipx)

### 🖋 Editors & IDEs
- **Visual Studio Code** (extensions tracked in `vscode-extensions.txt`)
- **JetBrains Toolbox** (IntelliJ IDEA, PyCharm, WebStorm, etc.)

### 📊 Learning & Experimentation
- **JupyterLab**
- **pandas**, **numpy**, **matplotlib**, **seaborn**, **scikit-learn**
- **PyTorch** (Apple Silicon optimized)
- **TensorFlow** (tensorflow-macos + tensorflow-metal)
- Optional: pyarrow, polars, duckdb, SQLAlchemy

---

## 🔄 Reproducibility

### Homebrew Packages
```sh
brew bundle --file=~/dotfiles/Brewfile
```

### VS Code Extensions
```sh
xargs -n 1 code --install-extension < ~/dotfiles/vscode-extensions.txt
```

### Python Packages
```sh
pip install -r ~/dotfiles/python-requirements.txt
```

### Databases & Services
```sh
cd ~/dev/services
make up    # start Postgres, pgAdmin, Redis
make down  # stop services
```

---

## 📂 Repository Structure

```
~/dotfiles
  ├── .zshrc
  ├── .zprofile
  ├── .p10k.zsh
  ├── .gitconfig
  ├── .gitignore_global
  ├── Brewfile
  ├── setup.sh
  ├── vscode-extensions.txt
  ├── python-requirements.txt
  ├── README.md
```

---

## 📌 Notes
- **Jupyter notebooks** live in `~/dev/learning/notebooks`
- **Docker services** are in `~/dev/services`
- **Cloud SDKs** require authentication after install:
  - `aws configure` or `aws sso login`
  - `az login`
  - `gcloud init`
  - `databricks auth login`
- `.env` files for services are **not committed** — use `.env.example` as a template

---

## 🏷 Versioning
You can tag known-good states:
```sh
git tag v1.0
git push origin main --tags
```

---

## ✅ Restore in One Command
Once Homebrew is installed and dotfiles cloned:
```sh
cd ~/dotfiles && ./setup.sh
```
This will:
- Install all Homebrew packages from Brewfile
- Symlink shell configs
- Install language managers + default versions
- Set up Python, Node.js, Java
- Install VS Code extensions
- Provision Docker services
