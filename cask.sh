#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  atom
  boxer
  caffeine
  charles
  colloquy
  divvy
  dropbox
  filezilla
  firefox
  firefoxdeveloperedition
  firefox-nightly
  flux
  gitx-l
  google-chrome
  google-chrome-canary
  hex-fiend
  imagealpha
  imageoptim
  kaleidoscope
  mamp
  miro-video-converter
  mou
  ntfsmounter
  onepassword
  openemu
  opera
  opera-developer
  opera-beta
  qbittorrent
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-json
  recordit
  skype
  slowy
  steam
  sublime-text
  the-unarchiver
  torbrowser
  transmission
  virtualbox
  vlc
)

# Fonts
fonts=(
  font-clear-sans
  font-roboto
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  brew install caskroom/cask/brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}

  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
