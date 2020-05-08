export EDITOR='vim'
export TERM="xterm-256color"

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
# PS1='%B%F{240}%1~%f%b %# %F{green}> '
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
# Custom ZSH Binds
# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"
. /usr/share/autojump/autojump.sh
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
compdef vman="man"
# Custom ZSH Binds
# bindkey '^L' autosuggest-accept
# Options
#   Corrections
# setopt CORRECT
# setopt CORRECT_ALL
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"


# Plugins
source /usr/share/autojump/autojump.sh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
