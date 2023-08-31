
source ~/.config/fish/alias.fish
source ~/.config/fish/secret.fish

set -Ux EDITOR hx
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH "~/Library/Application\ Support/JetBrains/Toolbox/scripts" $PATH
set -gx PATH "~/.cargo/bin" $PATH
set -gx PATH "/Users/todd/.cargo/bin" $PATH
set -gx ZELLIJ_CONFIG_DIR "/Users/todd/.config/zellij"
set -gx PATH "/Users/todd/.local/bin" $PATH
set -gx XDG_CONFIG_HOME "$HOME/.config"
# pnpm
set -gx PNPM_HOME /Users/todd/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
