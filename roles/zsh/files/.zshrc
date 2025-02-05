HOMEBREW="$(which brew)"
if [[ -f HOMEBREW ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(HOMEBREW shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions

# Starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship


# Add in snippets
# Needed for loading next git.zsh without [_defer_async_git_register:4: command not found: _omz_register_handler errors]
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::eza
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit -u

zinit cdreplay -q

# Completion styling
zstyle ':omz:plugins:eza' 'icons' 'yes'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Fuzzy search
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

# All custom functions
for file in $HOME/.config/zsh/*.zsh; do
  source "$file"
done

# zi is defined by zinit as alias zi='zinit'. Unalias it to use with zoxide
# unalias zi

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
alias icat="kitty +kitten icat"

# Map nvim as vim
alias v="nvim"
alias vim="nvim"
export EDITOR="nvim"

# Aliases
# rc files
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias zshrc="nvim ~/.zshrc"
alias kitty.conf="nvim ~/.config/kitty/kitty.conf"
alias lfrc="nvim ~/.config/lf/lfrc"
alias yabairc="nvim ~/.config/yabai/yabairc"
alias karabiner.json="nvim ~/.config/karabiner/karabiner.json"
alias starship.toml="nvim ~/.config/starship.toml"


alias lg="lazygit"
alias q="exit"
alias c="clear"
alias nvimdir="cd ~/.config/nvim/lua"
alias dotf="cd ~/.dotfiles"
alias adbr="adb kill-server && adb start-server"
alias gw="./gradlew"

function fz() {
  z $(fd -t d | fzf)
}

# Machine specific
if [[ -f ~/.machine.zsh ]]; then
  source ~/.machine.zsh
fi

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/mslalith/.dart-cli-completion/zsh-config.zsh ]] && . /Users/mslalith/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

