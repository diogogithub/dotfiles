[[ -o interactive ]] || return

[[ -r $HOME/.profile ]] && source $HOME/.profile

: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_STATE_HOME:=$HOME/.local/state}

mkdir -p "$XDG_CACHE_HOME/zsh" "$XDG_STATE_HOME/zsh"

for config_file in "$XDG_CONFIG_HOME"/zsh/*.zsh(N); do
    source "$config_file"
done
unset config_file
