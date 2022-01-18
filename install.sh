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
brew install bash-completion ruby python node nvm watchman yarn zsh zsh-syntax-highlighting openjdk@8

# Install brew cask formulas
echo "\nInstalling CASK Formulas"
brew cask install iterm2 android-sdk android-platform-tools vlc visual-studio-code postman react-native-debugger docker slack brave-browser react-native-debugger

#copying terminal configs
echo "\nCopying Terminal Configs"
cp .zshrc .bash_profile ~/

echo "\nConfiguring JAVA"
sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
echo 'export PATH="/usr/local/opt/openjdk@8/bin:$PATH"' >> ~/.zshrc
yes | sudo ~/Library/Android/sdk/tools/bin/sdkmanager --licenses


echo "\nInstalling RVM"
\curl -sSL https://get.rvm.io | bash -s stable

echo "\nDone!"