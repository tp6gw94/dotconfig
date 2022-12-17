
source ~/.config/fish/alias.fish

# Configure Jump
# status --is-interactive; and source (jump shell fish | psub)

# Load all saved ssh keys
# /usr/bin/ssh-add -A ^/dev/null

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
starship init fish | source

if test -z "$FIG_DOTFILES_SOURCED"
  alias 'pn' 'pnpm'
  set -ug FIG_CHECKED_PROMPTS 1
  set -g FIG_DOTFILES_SOURCED 1
end

builtin contains $HOME/.fig/bin $PATH
or set --append PATH $HOME/.fig/bin

builtin contains $HOME/.local/bin $PATH
or set --append PATH $HOME/.local/bin

# if test "$FIG_DID_NOT_EXEC_FIGTERM" = 1
#     and test "$FIG_TERM" != 1
#     or set --query INSIDE_EMACS
#     set --erase FIG_DID_NOT_EXEC_FIGTERM
#     exit
# end


# Open scripts on keyboard shortcut
set --query FIG_SCRIPTS_KEYBIND; or set FIG_SCRIPTS_KEYBIND '\cf'

# function fig-open-scripts
#     fig run
#     commandline -f repaint
# end

# bind (string unescape $FIG_SCRIPTS_KEYBIND) fig-open-scripts

set --query TTY; or set TTY (command tty)
set --export TTY

set --export FIG_PID $fish_pid
set --export FIG_SET_PARENT $TERM_SESSION_ID
set --export LC_FIG_SET_PARENT $TERM_SESSION_ID

set --query FIG_HOSTNAME; or set FIG_HOSTNAME (fig _ hostname; or command hostname -f 2> /dev/null; or command hostname)
set --query FIG_SHELL_PATH; or set FIG_SHELL_PATH (fig _ get-shell)

function fig_osc
    builtin printf "\033]697;$argv[1]\007" $argv[2..-1]
end

function fig_copy_fn
    functions --erase $argv[2]
    functions --copy $argv[1] $argv[2]
    #builtin functions $argv[1] | sed "s/^function $argv[1]/function $argv[2]/" | source
end

function fig_fn_defined
    functions --query $argv[1]
    #test (builtin functions $argv[1] | command grep -vE '^ *(#|function |end$|$)' | command wc -l | command xargs) != 0
end

function fig_wrap_prompt
    set -l last_status $status
    fig_osc StartPrompt

    builtin printf "%b" (string join "\n" $argv)
    fig_osc EndPrompt

    return $last_status
end

function fig_preexec --on-event fish_preexec
    fig_osc "OSCLock=%s" "$FIGTERM_SESSION_ID"
    fig_osc PreExec

    if fig_fn_defined fig_user_mode_prompt
        fig_copy_fn fig_user_mode_prompt fish_mode_prompt
    end

    if fig_fn_defined fig_user_right_prompt
        fig_copy_fn fig_user_right_prompt fish_right_prompt
    end

    fig_copy_fn fig_user_prompt fish_prompt

    set fig_has_set_prompt 0
end

function fig_precmd --on-event fish_prompt
    set -l last_status $status

    fig_osc "OSCUnlock=%s" "$FIGTERM_SESSION_ID"
    fig_osc "Dir=%s" "$PWD"
    fig_osc "Shell=fish"
    fig_osc "ShellPath=%s" "$FIG_SHELL_PATH"
    if test -n "$WSL_DISTRO_NAME"
        fig_osc "WSLDistro=%s" "$WSL_DISTRO_NAME"
    end
    fig_osc "PID=%d" "$fish_pid"
    fig_osc "ExitCode=%s" "$last_status"
    fig_osc "TTY=%s" "$TTY"
    fig_osc "Log=%s" "$FIG_LOG_LEVEL"
    fig_osc "FishSuggestionColor=%s" "$fish_color_autosuggestion"

    if test -n "$USER"
        fig_osc "Hostname=%s@%s" "$USER" "$FIG_HOSTNAME"
    else
        fig_osc "Hostname=%s@%s" root "$FIG_HOSTNAME"
    end

    if test $fig_has_set_prompt = 1
        fig_preexec
    end

    if fig_fn_defined fish_mode_prompt
        fig_copy_fn fish_mode_prompt fig_user_mode_prompt
        function fish_mode_prompt
            fig_wrap_prompt (fig_user_mode_prompt)
        end
    end

    if fig_fn_defined fish_right_prompt
        fig_copy_fn fish_right_prompt fig_user_right_prompt
        function fish_right_prompt
            fig_wrap_prompt (fig_user_right_prompt)
        end
    end

    fig_copy_fn fish_prompt fig_user_prompt
    function fish_prompt
        fig_wrap_prompt (fig_user_prompt)
        fig_osc NewCmd=$FIGTERM_SESSION_ID
    end

    set fig_has_set_prompt 1

    if command -v fig &>/dev/null
        switch (fig _ pre-cmd)
            case EXEC_NEW_SHELL
                set -ge FIG_DOTFILES_SOURCED
                exec fish
        end
    end
end

set fig_has_set_prompt 0

if test -n "$PROCESS_LAUNCHED_BY_FIG"
    fig_osc DoneSourcing
end

begin; fig _ pre-cmd &> /dev/null &; end

