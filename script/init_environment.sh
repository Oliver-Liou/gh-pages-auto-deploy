#!/bin/bash

# Update packages database
pacman -Syu --noconfirm

# Installing git package
pacman -S --noconfirm git

# Installing openssh package
if [[ -n "${SSH_PRIVATE_KEY}" ]]; then
  pacman -S --noconfirm openssh
fi

# Installing ruby libraries
pacman -S --noconfirm ruby ruby-bundler

# Setting default ruby version
cp /usr/bin/ruby-* /usr/bin/ruby

# debug
ruby -v && bundle version

# This is a temporary workaround
git config --global --add safe.directory "*"
