[ -r "$XDG_CONFIG_HOME/shell/aliases.sh" ] && source "$XDG_CONFIG_HOME/shell/aliases.sh"

if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
fi

if (( $+commands[direnv] )); then
    eval "$(direnv hook zsh)"
fi

for candidate in \
    /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
    /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh; do
    [[ -r $candidate ]] && source "$candidate" && break
done
unset candidate

# Syntax highlighting must be sourced after widgets and key bindings.
for candidate in \
    /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
    [[ -r $candidate ]] && source "$candidate" && break
done
unset candidate
