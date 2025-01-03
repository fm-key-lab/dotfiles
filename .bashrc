#!/bin/bash
# Lab .bashrc for SuSE Linux

# Global definitions
if [ -f /etc/bashrc ]; then
  # shellcheck source=/etc/bashrc
  . /etc/bashrc
fi

# Personal installs
if ! [[ "$PATH" =~ $HOME/.local/bin:$HOME/bin: ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Custom aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    # shellcheck source=/dev/null
    [ -f "$rc" ] && . "$rc"
  done
fi
unset rc