# Future Improvements for macOS Development Setup

This document lists potential enhancements to improve automation, reliability, and maintainability of this setup.

---

## 1️⃣ Automated Verification in setup.sh
**Why:** Ensure the setup process completes successfully and detect missing components immediately.

**Plan:**
- Append a `make doctor` call at the end of `setup.sh` to run all health checks automatically.
- Any issues will be displayed right after the setup finishes.

Example addition to `setup.sh`:
```bash
echo "Running post-install checks..."
make -C "$HOME/dotfiles" doctor || true
```

---

## 2️⃣ GitHub Actions Workflow to Test Setup
**Why:** Validate that the setup works on a fresh macOS environment whenever changes are pushed.

**Plan:**
- Use GitHub Actions with `macos-latest` runner to run `setup.sh` and `make doctor`.
- Detects broken installs or outdated formulae before setting up a real machine.

Example workflow (`.github/workflows/test-macos-setup.yml`):
```yaml
name: Test macOS Setup

on:
  push:
    branches: [ main ]
  pull_request:

jobs:
  macos-setup:
    runs-on: macos-latest
    steps:
      - name: Checkout dotfiles
        uses: actions/checkout@v4

      - name: Run setup
        run: ./setup.sh

      - name: Verify setup
        run: make doctor
```

---

## 3️⃣ Additional Service Templates
**Why:** Expand local development capabilities.

**Ideas:**
- Add MongoDB and MailHog to `docker-compose.yml` for document DB work and email testing.
- Add LocalStack for AWS service simulation.

---

## 4️⃣ Secrets Management Integration
**Why:** Manage `.env` and sensitive data securely.

**Ideas:**
- Integrate with 1Password CLI, Bitwarden CLI, or AWS Secrets Manager for pulling secrets at setup time.

---

## 5️⃣ Documentation Enhancements
**Ideas:**
- Add `docs/troubleshooting.md` entries for common brew formula conflicts.
- Create `docs/customization.md` for personalizing themes, aliases, and environment variables.
- Add screenshots of Powerlevel10k theme and VS Code extensions.

---

*Maintaining this list ensures the setup remains modern, portable, and developer-friendly.*
