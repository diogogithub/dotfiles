autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
if [[ -n ${LS_COLORS:-} ]]; then
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/completion"
