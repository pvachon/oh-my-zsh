if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%}]%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

ZLE_RPROMPT_INDENT=1

# Generate the prompt based on the current state of affairs
function prompt_func() {
    _prompt_error_code="%(?..%{$fg_bold[red]%}terminated with code %?
%{$reset_color%})"
    _prompt_date='%D{%Y-%m-%d %H:%M:%S}'
    _prompt_left="%{$fg_bold[$NCOLOR]%}%n%{$fg[magenta]%}@%m:%{$fg_bold[blue]%}%~%{$reset_color%}"
    _prompt_left_replica='%n@%m:%~'
    _prompt_date_len=$#_prompt_date
    _prompt_left_len=${#${(%):-$_prompt_left_replica}}
    _pad_length=$(($COLUMNS - $_prompt_date_len - $_prompt_left_len + 1))
    echo "$_prompt_error_code$_prompt_left${(r:$_pad_length:: :)}%{$fg[yellow]%}$_prompt_date%{$reset_color%}"
}

PROMPT='$(prompt_func)
> '
RPROMPT='$(git_prompt_info)'

