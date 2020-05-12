[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[ -f "$HOME/.xprofile" ] && "$HOME/.xprofile"
