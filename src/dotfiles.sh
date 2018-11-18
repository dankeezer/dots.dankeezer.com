#!/bin/sh -e
#
# dotfiles repository download script
#
# Inspired by Darryl Abbate
# https://github.com/rootbeersoup/get.darryl.sh
#
# Built for Dan Keezer's dotfiles
# https://github.com/dankeezer/dotfiles
#
# Run with either command:
# curl -fsSL dots.dankeezer.com | sh
# wget -qO- dots.dankeezer.com | sh

# Exit if a dotfiles directory already exists
dotfiles_check ()
{
  if [ -d "$HOME/.dotfiles" ]; then
    printf "\\033[31mERROR:\\033[0m ~/.dotfiles already exists on this system.\\n" >&2
    exit 1
  fi
}

main()
{
  # If git isn't installed
  if ! [ -x "$(command -v git)" ]; then

    # Download repo tar.gz via curl
    if [ -x "$(command -v curl)" ]; then
      curl -L https://github.com/dankeezer/dotfiles/archive/master.tar.gz -o "$HOME/dotfiles-master.tar.gz"
      tar xzf "$HOME/dotfiles-master.tar.gz"
      mv "$HOME/dotfiles-master" "$HOME/.dotfiles"

    # Else, download repo tar.gz via wget
    elif [ -x "$(command -v wget)" ]; then
      wget -O "$HOME/dotfiles-master.tar.gz" https://github.com/dankeezer/dotfiles/archive/master.tar.gz
      tar xzf "$HOME/dotfiles-master.tar.gz"
      mv "$HOME/dotfiles-master" "$HOME/.dotfiles"
    fi

  # Else, clone the dotfiles repo via git
  else
    git clone --recursive https://github.com/dankeezer/dotfiles.git "$HOME/.dotfiles"
  fi

  # Verify successful download and print instructions for the user
  if [ -d "$HOME/.dotfiles" ]; then
    printf "\\033[32mSUCCESS:\\033[0m Repository downloaded to ~/.dotfiles\\nNavigate to ~/.dotfiles and run \`make help\` for usage info\\n"
  else
    printf "\\033[31mERROR:\\033[0m dotfiles either not downloaded or not extracted successfully\\n" >&2
    exit 1
  fi
}

dotfiles_check
main