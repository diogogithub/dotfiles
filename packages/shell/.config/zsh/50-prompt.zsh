autoload -Uz add-zsh-hook vcs_info colors
colors

zstyle ':vcs_info:git:*' formats ' %F{blue}[git:%b%u%c]%f'
zstyle ':vcs_info:git:*' actionformats ' %F{blue}[git:%b|%a%u%c]%f'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}*%f'
zstyle ':vcs_info:*' check-for-changes true

_dotfiles_prompt_precmd() {
    local exit_code=$?
    local python_env=''

    vcs_info
    if (( exit_code == 0 )); then
        PROMPT_STATUS='%F{green}[exit:0]%f'
    else
        PROMPT_STATUS="%F{red}[exit:${exit_code}]%f"
    fi

    if [[ -n ${VIRTUAL_ENV:-} ]]; then
        python_env=${VIRTUAL_ENV:t}
    elif [[ -n ${CONDA_DEFAULT_ENV:-} ]]; then
        python_env=$CONDA_DEFAULT_ENV
    elif [[ -n ${PYENV_VERSION:-} && $PYENV_VERSION != system ]]; then
        python_env=$PYENV_VERSION
    fi

    if [[ -n $python_env ]]; then
        python_env=${python_env//\%/%%}
        PROMPT_PYTHON=" %F{magenta}[py:${python_env}]%f"
    else
        PROMPT_PYTHON=''
    fi
}
add-zsh-hook precmd _dotfiles_prompt_precmd

setopt PROMPT_SUBST
PROMPT='%F{242}[%D{%Y-%m-%d %H:%M:%S}]%f ${PROMPT_STATUS} %F{green}%n%f@%F{cyan}%m%f %F{yellow}%~%f${vcs_info_msg_0_}${PROMPT_PYTHON} %# '
RPROMPT=''
