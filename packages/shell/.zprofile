# Keep login-shell state in the POSIX profile.
[ -r "$HOME/.profile" ] && . "$HOME/.profile"

if command -v tty >/dev/null 2>&1; then
    GPG_TTY=$(tty 2>/dev/null || printf '')
    [ -n "$GPG_TTY" ] && export GPG_TTY
fi
