#!/bin/bash
# shellcheck disable=SC2086

#
# Overwrites
#

# verbose cd
function vcd { builtin cd "$@" || return && echo -e "\n\033[1;30m📁 $OLDPWD \033[0m\033[1;32m→\033[0m \033[1;32m$PWD\033[0m\n"; }

# Allow use of 'cd ...' to cd up 2 levels, 'cd ....' up 3, etc. (like 4NT/4DOS)
# Usage: cd ..., etc.
# Adapted from: Example 16-15, bash Cookbook 2e, Albing & Vossen, 2017.
function cd {
  # shellcheck disable=SC1007
  local option= length= count= cdpath= i=
  if [ "$1" = "-P" ] || [ "$1" = "-L" ]; then
    option="$1"
    shift
  fi
  if [ -n "$1" ] && [ "${1:0:3}" = '...' ] && [ "$1" = "${1%/*}" ]; then
    length=${#1}
    count=2
    for ((i=count; i<=length; i++)); do
      cdpath="${cdpath}../"
    done
    vcd $option "$cdpath"
  elif [ -n "$1" ]; then
    vcd $option "$*"
  else
    vcd $option
  fi
} # end of cd
function mv { builtin mv -i; }
function rm { builtin rm -i; } # Can use -f to override interactive nags for destructive disk writes

#
# Misc
#

# Adapted from: https://github.com/davidagraf/doi2bib2/issues/94#issuecomment-2325203272
# Usage: bib https://doi.org/10.1007/978-0-387-21736-9
function bib {
  curl --silent -LH "Accept: application/x-bibtex" "$1" | \
    sed -E -e 's/}$/\n}/g' -e 's/^\s//g' -e 's/,\s([a-zA-Z]+=)/,\n    \1/g'
}

function activate_venv {
  # shellcheck source=/dev/null
  source "$HOME/dev/envs/$1/.venv/bin/activate"
} 

function cp_dir {
  while getopts ":h-:" opt; do
    case $opt in
      h)
        echo "Usage: cp_dir <source_directory> <destination_directory>"
        echo "Copies a directory and its contents to the specified destination."
        echo "Example: cp_dir /path/to/source /path/to/destination"
        return 0
        ;;
      -)
        case "${OPTARG}" in
          help)
            echo "Usage: cp_dir <source_directory> <destination_directory>"
            echo "Copies a directory and its contents to the specified destination."
            echo "Example: cp_dir /path/to/source /path/to/destination"
            return 0
            ;;
          *)
            echo "Unknown option --${OPTARG}"
            return 1
            ;;
        esac
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
    esac
  done
  shift $((OPTIND - 1))

  [ -d "$1" ] || { echo "Error: Directory '$1' does not exist."; false; } \
  && if [ ! -d "$2" ]; then
      read -rp "Directory '$2' does not exist. Create it? (y/n): " response
      if [[ $response =~ ^[Yy]$ ]]; then
          mkdir -p "$2"
      fi
  fi \
  && rsync -au --progress "$1" "$2"
}

function job_end {
  if [ -z "$1" ]; then
    jobid=$(squeue --noheader -o %A -u "$USER" | head -n 1)
  else
    jobid=$1
  fi
  scontrol show job "$jobid" | awk -F'EndTime=' '{print $2}' | awk '{print $1}' | tr -d '\n'
}

# Function to calculate 3/4 of slurm's MaxSubmit and set as an environment variable
function set_max_submit_job_limit {
  max_submit=$(sacctmgr list user "$USER" withassoc format=MaxSubmit | awk 'NR==3 {print $1}')
  if [[ $max_submit =~ ^[0-9]+$ ]]; then
    export SLURM_MAX_SUBMIT_JOB_LIMIT=$((max_submit * 3 / 4))
  else
    echo "Failed to retrieve MaxSubmit. MAXSUBMIT_LIMIT not set."
  fi
}

set_max_submit_job_limit