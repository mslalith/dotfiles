# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew packages
brew install lazygit
brew install zoxide
brew install eza
brew install bat
brew install thefuck
brew install lsd
brew install starship
brew install atuin
brew install ripgrep
brew install --cask iina
brew install --cask shottr


# yabai
brew install koekeishiya/formulae/yabai
brew services start koekeishiya/formulae/yabai
chmod +x ./yabai/.config/yabai/yabairc

# karabiner-elements
brew install --cask karabiner-elements

