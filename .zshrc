# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
source "$HOME/.local/share/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "esc/conda-zsh-completion"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="~/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/todd/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
