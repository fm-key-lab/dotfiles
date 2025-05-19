#!/bin/bash

alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'

alias mv='mv -i'
alias rm='rm -i' # Can use -f to override interactive nags for destructive disk writes

# SLURM
alias srund="srun --mem=16G --time=12:00:00 -p datatransfer --pty bash"
alias sruni="srun -n 1 -p interactive --mem=16G --cpus-per-task=8 --time=1:58:59 --pty bash"

# git
alias commit='git commit'
alias push='git push'
alias st='git st'
alias status='git status'
alias pull='git pull'
alias gping="ssh -T git@github.com"

# Other software
alias vsps="ps auwx | grep '[v]scode-server'" # Check for running vscode-server processes

case "$HOSTNAME" in
  # meerkatze
  meerkatze )
    alias rawdata='cd /mnt/rawdata' # Raw data directory
    alias dist='echo Debian'        # Get Linux distribution
  ;;
  # logan-1
  logan* )
    alias rawdata='cd /mnt/rawdata' # Raw data directory
    alias dist='echo Debian'        # Get Linux distribution
  ;;
  # raven01, raven02, ...
  raven* )
    alias kls='klist -c /tmp/krb5cc_$(id -u)_raven*' # Get Kerberos ticket
    alias dist='echo $ID_LIKE'                        # Get Linux distribution (SUSE)
  ;;
  # viper01, viper02, ...
  viper* )
    alias kls='klist -c /tmp/krb5cc_$(id -u)_viper*' # Get Kerberos ticket
  ;;
  # HOSTNAME is undefined
  "" )
  ;;
  # Linux default
  * ) 
    alias arch='uname -m'
    alias platform='uname'

    # Useful websites
    alias docs="open https://docs.mpcdf.mpg.de/doc/computing/viper-user-guide.html"
    alias email="open https://webmail.mpiib-berlin.mpg.de"
    alias helpdesk="open https://helpdesk.mpcdf.mpg.de/mpcdf/SelfService/"
    alias mm="open https://minervamessenger.mpdl.mpg.de"
    alias mpg_resources="open https://rena.mpdl.mpg.de/rena/"
    alias nextcloud="open https://transfer.mpiib-berlin.mpg.de/"
    alias oreilly="open https://learning.oreilly.com/home/"
  ;;
esac