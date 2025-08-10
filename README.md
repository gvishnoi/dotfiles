# Setting Up a New Mac Machine | macOS Development Setup

This repository contains my **complete macOS development environment configuration** — including shell setup, language managers, databases, cloud SDKs, IDE settings, and data science tools — all tracked in version control for a **tidy, reproducible, and automated setup**.  

It is designed so that with **one command**, a fresh Mac can be provisioned with all essential tools, configurations, and services required for my work across **AEM, Java, Python, microservices, cloud platforms, and data/ML projects**.


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

### 🛠 Developer Tools
- **Docker Desktop**
- **Postman** — API testing and development
- **Kubernetes**: kubectl, helm, k9s, stern
- **IaC & Pipelines**: Terraform, OpenTofu, act
- **Cloud CLIs**: AWS CLI, Azure CLI, Google Cloud SDK, Databricks CLI
- **Kafka Tools (optional)**:
  - Apache Kafka CLI (`kafka-topics`, `kafka-console-producer`, `kafka-console-consumer`)
  - `kcat` (formerly kafkacat) for quick topic produce/consume tests
  - Optional GUI (Docker): `provectuslabs/kafka-ui`


#### Kafka quickstart (local, CLI)
```sh
# Start a local Kafka (for quick tests) - prefer Docker-based stacks in projects
# Kafka via brew installs scripts, but running a full broker locally is out of scope here.
# Use Docker-based Kafka stacks (e.g., Confluent or Bitnami) in project repos.

# Verify tools:
kafka-topics --version
kcat -V
```


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


## 📌 Notes
- **Jupyter notebooks** live in `~/dev/learning/notebooks`
- **Docker services** are in `~/dev/services`
- **Cloud SDKs** require authentication after install:
  - `aws configure` or `aws sso login`
  - `az login`
  - `gcloud init`
  - `databricks auth login`
- `.env` files for services are **not committed** — use `.env.example` as a template


## 🏷 Versioning
You can tag known-good states:
```sh
git tag v1.0
git push origin main --tags
```


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



## 👤 Who This Is For
This setup is designed for:
- Developers working on **AEM (Adobe Experience Manager)** projects
- **Java** and **Spring Boot** microservices
- **Python** for data engineering, ML, and automation
- **Cloud** integrations with AWS, Azure, GCP, and Databricks
- Local development requiring **PostgreSQL**, **Redis**, and containerized services
- Anyone who values a **version-controlled**, **reproducible**, and **tidy** macOS dev environment


## 🚫 What’s Not Included
- Licensing or installation of **paid software** (e.g., IntelliJ IDEA Ultimate, Adobe tools) — install separately
- Sensitive configuration files (API keys, SSH keys, `.env` secrets) — templates are provided instead
- Complex production cluster setups — this is focused on local development
- Non-macOS systems — while many steps are portable, this script is optimized for Apple Silicon Macs


## 📚 Additional Documentation
- [Local Development Services](docs/services.md)
- [Troubleshooting Guide](docs/troubleshooting.md)
- [Future Improvements](FUTURE_IMPROVEMENTS.md)

