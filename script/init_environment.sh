#!/bin/bash

# Generate a default secret key
# To prevent archlinux-keyring from no secret key available to sign with
# pacman-key --init

# Update packages database
pacman -Syu --noconfirm

# Installing git package
pacman -S --noconfirm git

# Installing openssh package
if [[ -n "${SSH_PRIVATE_KEY}" ]]; then
  pacman -S --noconfirm openssh
fi

# Installing ruby libraries
pacman -Sy --noconfirm ruby ruby-bundler

# Setting default ruby version
cp /usr/bin/ruby-3.0.6-1 /usr/bin/ruby

# debug
ruby -v && bundle version

# This is a temporary workaround
git config --global --add safe.directory "*"