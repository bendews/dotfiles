#!/usr/bin/env bash
# I like keeping things stock :)

# Close System Preferences to prevent overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for administrator password upfront
sudo --validate

# Screensaver: set screensaver to Aerial
defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "moduleName" -string "Aerial"
defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "path" -string $HOME"/Library/Screen Savers/Aerial.saver"
defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "type" -int "0"

# Safari: developer mode
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Restart applications
killall Dock
killall Finder
killall Safari
