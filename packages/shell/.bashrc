case $- in
    *i*) ;;
    *) return ;;
esac

[ -r "$HOME/.profile" ] && . "$HOME/.profile"

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend checkwinsize

[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh" ] \
    && . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh"

if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi
