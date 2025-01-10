#!/bin/bash

# Adapted from Example 4-1. A function for cd-ing to faraway directories, Barrett, 2022 
qcd () {
  case "$1" in
    dev)
      cd "/raven/u/$USER/dev" || exit
      ;;
    projects)
      cd "/raven/u/$USER/dev/projects" || exit
      ;;
    work)
      cd "/raven/u/$USER/dev/workspaces" || exit
      ;;
    envs)
      cd "/raven/u/$USER/dev/envs" || exit
      ;;
    labtools)
      cd "$GROUP_HOME/tools" || exit
      ;;
    tmp)
      cd "/ptmp/$USER" || exit
      ;;
    *)
      echo "qcd: unknown key '$1'"
      return 1
      ;;
  esac
  pwd
}

# Set up tab completion
complete -W "dev projects work envs labtools tmp" qcd