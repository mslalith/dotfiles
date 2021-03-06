# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew packages
brew install git
brew install lazygit
brew install zoxide
brew install exa
brew install bat
brew install lsd
brew install lf
brew install git-delta
brew install starship
brew install ripgrep
brew install fd
brew install jq


# yabai
brew install koekeishiya/formulae/yabai
brew services start koekeishiya/formulae/yabai
chmod +x ./yabai/.config/yabai/yabairc

# ubersicht
brew install --cask ubersicht

# karabiner-elements
brew install --cask karabiner-elements

