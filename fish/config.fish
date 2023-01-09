
source ~/.config/fish/alias.fish
if test "$TERM_PROGRAM" != "WarpTerminal"
    # Existing bootstrap script here
# Fish syntax highlighting
  set -g fish_color_autosuggestion '555'  'brblack'
  set -g fish_color_cancel -r
  set -g fish_color_command --bold
  set -g fish_color_comment red
  set -g fish_color_cwd green
  set -g fish_color_cwd_root red
  set -g fish_color_end brmagenta
  set -g fish_color_error brred
  set -g fish_color_escape 'bryellow'  '--bold'
  set -g fish_color_history_current --bold
  set -g fish_color_host normal
  set -g fish_color_match --background=brblue
  set -g fish_color_normal normal
  set -g fish_color_operator bryellow
  set -g fish_color_param cyan
  set -g fish_color_quote yellow
  set -g fish_color_redirection brblue
  set -g fish_color_search_match 'bryellow'  '--background=brblack'
  set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
  set -g fish_color_user brgreen
  set -g fish_color_valid_path --underline
  starship init fish | source
else
end
# Configure Jump
# status --is-interactive; and source (jump shell fish | psub)

# Load all saved ssh keys
# /usr/bin/ssh-add -A ^/dev/null


set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "/usr/local/bin" $PATH
set -gx PATH "~/Library/Application\ Support/JetBrains/Toolbox/scripts" $PATH
set -gx PATH "~/.cargo/bin" $PATH
set -gx PATH "/Users/todd/.cargo/bin" $PATH
set -gx ZELLIJ_CONFIG_DIR "/Users/todd/.config/zellij"
set -gx PATH "/Users/todd/.local/bin" $PATH
# pnpm
set -gx PNPM_HOME "/Users/todd/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
