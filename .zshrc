# Homebrew (shell env goes in .zprofile; this is a fallback)
eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Powerlevel10k (loaded via theme above)
# If you ran the wizard, it creates ~/.p10k.zsh — feel free to move it into dotfiles and link it.

# nvm (Node)
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# pyenv (Python)
eval "$(pyenv init -)" 2>/dev/null
eval "$(pyenv virtualenv-init -)" 2>/dev/null

# fzf keybindings (optional)
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && . /opt/homebrew/opt/fzf/shell/key-bindings.zsh

# Powerlevel10k from Homebrew
[[ -r /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --- nvm (Node) ---
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# --- pyenv (Python) ---
command -v pyenv >/dev/null && eval "$(pyenv init -)"
command -v pyenv >/dev/null && eval "$(pyenv virtualenv-init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# --- SDKMAN! (Java/Maven/Gradle) ---
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  # Ensure default Java 17 on shell startup
  sdk use java 17.0.11-tem >/dev/null 2>&1
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# --- nvm (Node Version Manager) ---
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Created by `pipx` on 2025-08-10 22:04:26
export PATH="$PATH:/Users/gvishnoi/.local/bin"

# --- kubectl helpers ---
alias k=kubectl
complete -o default -F __start_kubectl k 2>/dev/null || true
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
