export LC_ALL=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mslalith"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kitty
alias icat="kitty +kitten icat"

# thefuck completion
eval $(thefuck --alias)

# zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Map nvim as vim
alias v="nvim"
alias vim="nvim"
export EDITOR="nvim"

# Aliases
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias zshrc="nvim ~/.zshrc"
alias lfrc="nvim ~/.config/lf/lfrc"
alias lg="lazygit"
alias ls="exa"
alias x="exit"
alias c="clear"
alias nvimdir="cd ~/.config/nvim/lua"
alias dotfiles="cd ~/.dotfiles"
alias adbr="adb kill-server && adb start-server"

function ggacp() {
  git add .
  git commit -m "$1"
  git push
}

function ggcp () {
  git commit -m "$1"
  git push
}

