#!/bin/zsh
# Default environment variable
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export GDK_SCALE=2
export EDITOR="nvim"
export TERMINAL="alacritty"
export VISUAL="$EDITOR"
export TERM="xterm-256color"
export BROWSER="firefox"
export LANG="en_US.UTF-8"
# LESS COLORS
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# PROMTS
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
export TODO_DIR="$HOME/.todo"	
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#87d7ff"
# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
"
# FZF OPTIONS
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
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
[ -f "$HOME/.zsh/functions" ] && source "$HOME/.zsh/functions"
# Custom ZSH Binds
# bindkey '^L' autosuggest-accept
# Color schemes for man pages
[ -x "$HOME/.mancolor" ] && source $HOME/.mancolor
# Options
#   Corrections
# Expand Path
# export PATH=$PATH:$HOME/.local/bin
# setopt CORRECT
# setopt CORRECT_ALL
# FZF options
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# Enter Normal Mode
bindkey 'jj' vi-cmd-mode
bindkey '^a' autosuggest-accept
# Plugins
[ -f "/usr/share/autojump/autojump.sh" ] && source /usr/share/autojump/autojump.sh
[ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "/usr/share/doc/fzf/examples/completion.zsh" ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
