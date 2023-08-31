source "$HOME/.local/share/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "esc/conda-zsh-completion"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH="/Users/todd/.cargo/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/todd/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

alias gac="git add .;git commit"
alias pn="pnpm"

eval "$(starship init zsh)"
