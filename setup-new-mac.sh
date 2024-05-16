#!/bin/bash
sudo softwareupdate --install-rosetta

which -s brew

# Check if Homebrew is installed
if [[ $? != 0 ]] ; then
  # Install Homebrew
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
  source ~/.zshrc
fi

# Upgrade Homebrew
echo "Upgrading Homebrew..."
brew upgrade

echo "Upgrading Homebrew..."
brew tap homebrew/cask-fonts

# Install Formulas
echo "Installing Formulas..."
brew install python node nvm yarn zsh tig tmux font-meslo-lg-nerd-font zsh-syntax-highlighting

# Install Casks
echo "Installing Casks..."
brew install temurin@8 android-sdk android-platform-tools android-studio visual-studio-code docker microsoft-edge alacritty

# Set NVM as default Node.js version
echo "Setting NVM as default Node.js version..."
nvm install system && nvm alias default system

# Set ZSH as default shell
echo "Setting ZSH as default shell..."
chsh -s $(which zsh)

# Copy terminal configs
echo "Copying Alacritty configs..."
mkdir -p ~/.config/alacritty
cp alacritty.toml ~/.config/alacritty/

# Install oh-my-zsh
echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Reload ZSH configuration
echo "Reloading ZSH configuration..."
source ~/.zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

# Set Alacritty as default terminal
echo "Setting Alacritty as default terminal..."
echo 'export PATH="/opt/homebrew/opt/alacritty/bin:$PATH"' >> ~/.zshrc
echo 'export TERM="xterm-256color"' >> ~/.zshrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Reload ZSH configuration
echo "Reloading ZSH configuration..."
source ~/.zshrc

# tmux
echo "Setting Tmux"
tmux set -g mouse on

# Installing RVM
echo "Install rvm - ruby version manager"
\curl -sSL https://get.rvm.io | bash -s stable --ruby

rvm install 3.3.1 --with-openssl-dir=$(brew --prefix)/opt/openssl@3

rvm use 3.3.1

# MAC OS Setup
echo "Configuring Mac OS.."
# Set trackpad right click to "Bottom Right Corner"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
# Don't show recent apps in the Dock
defaults write com.apple.dock show-recents -bool false
# disable "Automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false
# enable press and hold
defaults write -g ApplePressAndHoldEnabled -bool true
# set textEdit plain text
defaults write com.apple.TextEdit RichText -int 0

killall cfprefsd
killall Dock

# Complete setup
echo "Initial setup complete! Please restart your computer for changes to take effect."