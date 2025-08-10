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
