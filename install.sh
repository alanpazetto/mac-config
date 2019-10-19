which -s brew

if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi

# Install brew formulas
echo "\nInstalling Formulas"
brew install bash-completion ruby python node nvm watchman yarn zsh zsh-syntax-highlighting

# Install brew cask formulas
echo "\nInstalling CASK Formulas"
brew cask install iterm2 osxfuse android-sdk vlc visual-studio-code postman react-native-debugger docker

#copying terminal configs
echo "\nCopying Terminal Configs"
cp .zshrc .bash_profile ~/

echo "\nDone!"