#!/bin/bash

# XDG Base Directory Specification
# See: https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html

# MPCDF defaults
export XDG_SESSION_CLASS
export XDG_SESSION_ID
export XDG_SESSION_TYPE

# The XDG Base Directory Specification is based on the following concepts:

# -- There is a single base directory relative to which user-specific data files should be written. 
# -- This directory is defined by the environment variable $XDG_DATA_HOME.
export XDG_DATA_HOME="${HOME}/.local/share" # XDG default

# -- There is a single base directory relative to which user-specific configuration files should be written.
# -- This directory is defined by the environment variable $XDG_CONFIG_HOME.
export XDG_CONFIG_HOME="${HOME}/.config" # XDG default

# -- There is a single base directory relative to which user-specific state data should be written.
# -- This directory is defined by the environment variable $XDG_STATE_HOME.
export XDG_STATE_HOME="${HOME}/.local/state" # XDG default

# -- There is a single base directory relative to which user-specific executable files may be written.

# -- There is a set of preference ordered base directories relative to which data files should be searched.
# -- This set of directories is defined by the environment variable $XDG_DATA_DIRS.
export XDG_DATA_DIRS # MPCDF default
# ~/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

# -- There is a set of preference ordered base directories relative to which configuration files should be searched.
# -- This set of directories is defined by the environment variable $XDG_CONFIG_DIRS.
export XDG_CONFIG_DIRS=/etc/xdg # default

# -- There is a single base directory relative to which user-specific non-essential (cached) data should be written.
# -- This directory is defined by the environment variable $XDG_CACHE_HOME.
# export XDG_CACHE_HOME="${HOME}/.cache" # default
export XDG_CACHE_HOME="/ptmp/${USER}/.cache"

# -- There is a single base directory relative to which user-specific runtime files and other file objects should be placed.
# -- This directory is defined by the environment variable $XDG_RUNTIME_DIR.
export XDG_RUNTIME_DIR # MPCDF default

# -- All paths set in these environment variables must be absolute.
# -- If an implementation encounters a relative path in any of these variables it should consider the path invalid and ignore it.