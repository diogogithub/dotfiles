bindkey -v
export KEYTIMEOUT=10

# These are autoloaded ZLE widgets, not builtin keymap commands.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^V' edit-command-line
bindkey -M viins '^X^E' edit-command-line
