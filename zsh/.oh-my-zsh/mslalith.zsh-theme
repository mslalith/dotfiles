PROMPT="%(?:%F{#46b5d1}:%F{#d16246})"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)🤙 '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{#89C9D9}\uf7a1 (%F{#89C9D9}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#89C9D9}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{#89C9D9})"
