export CLICOLOR=1

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ANDROID
export ANDROID_HOME="~/Library/Android/sdk"
export ANDROID_TOOLS="~/Library/Android/sdk/tools/"
export ANDROID_PLATFORM_TOOLS="~/Library/Android/sdk/platform-tools"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$ANDROID_SDK_ROOT

function emu {
 /$ANDROID_HOME/emulator/emulator -avd $1
}

function yarn-run-x {
 yarn run-ios --simulator="iPhone X"
}

function yarn-run-8 {
 yarn run-ios --simulator="iPhone 8"
}

function git-force-clean {
 git clean -fdx && yarn install && yarn install-gems && yarn install-ios
}

function git-diff {
 git diff > gd~1.diff && code gd~1.diff &; sleep 2; rm gd~1.diff
}

function git-clean-local {
 git branch | egrep -v "(master|\*)" | xargs git branch -D
}

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
