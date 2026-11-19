# This file deliberately avoids replacing POSIX commands such as cat, ls, or cd.

if command -v nvim >/dev/null 2>&1; then
    alias v='nvim'
    alias vi='nvim'
    alias vim='nvim'
fi

if command -v eza >/dev/null 2>&1; then
    alias l='eza --group-directories-first'
    alias la='eza --all --group-directories-first'
    alias ll='eza --long --all --group --git --group-directories-first'
else
    alias l='ls'
    alias la='ls -A'
    alias ll='ls -al'
fi

if command -v btop >/dev/null 2>&1; then
    alias top='btop'
elif command -v htop >/dev/null 2>&1; then
    alias top='htop'
fi

if command -v bat >/dev/null 2>&1; then
    alias bcat='bat'
elif command -v batcat >/dev/null 2>&1; then
    alias bcat='batcat'
fi

if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias g='git'
