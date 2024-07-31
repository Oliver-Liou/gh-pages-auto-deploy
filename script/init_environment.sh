#!/bin/bash

# Generate a default secret key
# To prevent archlinux-keyring from no secret key available to sign with
pacman-key --init

# Update packages database
pacman -Syu --noconfirm

# Installing git package
pacman -S --noconfirm git

# Installing openssh package
if [[ -n "${SSH_PRIVATE_KEY}" ]]; then
  pacman -S --noconfirm openssh
fi

# Install asdf-vm
if [[ ! -f "${WORKING_DIR}/.asdf/asdf.sh" ]]; then
  git clone https://github.com/asdf-vm/asdf.git \
      ${WORKING_DIR}/.asdf --branch v0.14.0
fi

# Fix invalid cache to asdf tools' installation
ln -s ${WORKING_DIR}/.asdf ${HOME}/.asdf

source ${HOME}/.asdf/asdf.sh

# Install ruby environment
pacman -S --noconfirm libyaml

if ! asdf list ruby ${RUBY_VER} &>/dev/null; then
  # Clean up ruby environments avoiding unnecessary cache
  rm -rf ${WORKING_DIR}/.asdf/installs/ruby
  asdf plugin add ruby
  asdf install ruby ${RUBY_VER}
fi

asdf global ruby ${RUBY_VER}

# debug
ruby -v && bundle version

# This is a temporary workaround
git config --global --add safe.directory "*"