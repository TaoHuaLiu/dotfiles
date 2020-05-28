# Default environment variable
export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERM="xterm-256color"
export BROWSER="firefox"
export LANG="en_US.UTF-8"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hugo/.zshrc'


# Enable colors and change prompt:
autoload -U colors && colors
PS1='%(?.%F{green}>.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit
eval "$(pandoc --bash-completion)"
# Git Integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git
# Custom ZSH Binds
# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"
# Custom ZSH Binds
# bindkey '^L' autosuggest-accept
# Color schemes for man pages
[ -x "$HOME/.mancolor" ] && source $HOME/.mancolor
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# Options
#   Corrections
# Expand Path
# export PATH=$PATH:$HOME/.local/bin
# setopt CORRECT
# setopt CORRECT_ALL
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"

# FZF options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# Enter Normal Mode
bindkey 'jj' vi-cmd-mode

# Plugins
[ -f "/usr/share/autojump/autojump.sh" ] && source /usr/share/autojump/autojump.sh
[ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
