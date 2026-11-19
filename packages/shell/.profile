# Portable login environment shared by POSIX-compatible shells.

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

path_prepend() {
    [ -d "$1" ] || return 0
    case :${PATH:-}: in
        *:"$1":*) ;;
        *) PATH=$1${PATH:+:$PATH} ;;
    esac
}
path_prepend "$HOME/go/bin"
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/bin"
path_prepend "$HOME/.local/bin"
export PATH

if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
    export VISUAL=nvim
else
    export EDITOR=vi
    export VISUAL=vi
fi
export PAGER=less
export LESS='-F -R -S -X'

agent_mode_file=$XDG_CONFIG_HOME/dotfiles/ssh-agent
if [ -r "$agent_mode_file" ]; then
    agent_mode=$(sed -n '1p' "$agent_mode_file")
    case $agent_mode in
        bitwarden)
            native_socket="$HOME/.bitwarden-ssh-agent.sock"
            flatpak_socket="$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
            if [ -S "$native_socket" ] || [ ! -d "$HOME/.var/app/com.bitwarden.desktop" ]; then
                SSH_AUTH_SOCK=$native_socket
            else
                SSH_AUTH_SOCK=$flatpak_socket
            fi
            export SSH_AUTH_SOCK
            ;;
        openssh)
            if [ -n "${XDG_RUNTIME_DIR:-}" ]; then
                export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/dotfiles-ssh-agent.socket"
            fi
            ;;
        gpg)
            if command -v gpgconf >/dev/null 2>&1; then
                SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket 2>/dev/null || printf '')
                [ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK
            fi
            ;;
        desktop|none|'') ;;
    esac
fi
