# Post-Setup Checklist

After running `./setup.sh`, use this quick checklist to validate your environment.

## 1) Shell & Theme
- Open a new terminal tab/window
- You should see the Powerlevel10k prompt
- `echo $SHELL` shows `/bin/zsh`
- `source ~/.zshrc` works with no errors

## 2) Homebrew
```sh
brew doctor
brew --version
```
Expect no critical warnings.

## 3) Java Toolchain (SDKMAN)
```sh
java -version
mvn -v | head -n1
gradle -v | head -n1
```
Expect Java 17 (Temurin), Maven, and Gradle present.

## 4) Python Toolchain (pyenv)
```sh
pyenv versions
python -V
pip -V
```
Expect Python 3.12.4 active.

## 5) Node.js (nvm)
```sh
nvm --version
node -v
npm -v
```
Expect Node LTS versions.

## 6) VS Code
```sh
code --version
```
Open VS Code → ensure extensions are installed (see `~/dotfiles/vscode-extensions.txt`).

## 7) Docker & Services
```sh
docker --version
docker ps
cd ~/dev/services && docker compose ps
```
If you started services, Postgres/pgAdmin/Redis should be listed as `running`.

## 8) Cloud CLIs
```sh
aws --version
az version | head -n1
gcloud --version
databricks --version
```
Then authenticate: `aws sso login`, `az login`, `gcloud init`, `databricks auth login`.

## 9) JupyterLab
```sh
jupyter lab
```
Open in browser and run a simple Python cell: `print("Hello, Jupyter")`.

---

If you spot issues, run `make doctor` (below) for an automated check.
