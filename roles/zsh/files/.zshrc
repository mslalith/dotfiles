export LC_ALL=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:/Users/mslalith/.rustup/toolchains/stable-aarch64-apple-darwin/bin
export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:$PATH

ZSH_THEME="mslalith"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-vi-mode
#  zsh-autosuggestions
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

# Atui
eval "$(atuin init zsh)"

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


alias zj="zellij"
alias lg="lazygit"
alias ls="eza -l"
alias lsa="eza -la"
alias q="exit"
alias c="clear"
alias nvimdir="cd ~/.config/nvim/lua"
alias dotf="cd ~/.dotfiles"
alias adbr="adb kill-server && adb start-server"
alias gw="./gradlew"

function ggacp() {
  git add .
  git commit -m "$1"
  git push
}

function ggcp() {
  git commit -m "$1"
  git push
}

function fz() {
  z $(fd -t d | fzf)
}

# Google Repo
# export PATH=~/bin:$PATH
# function repo() {
#   command python3 ~/bin/repo $@
# }

# config for androidx project
export JAVA_HOME="/Users/mslalith/Library/Java/JavaVirtualMachines/azul-17.0.5/Contents/Home/"
