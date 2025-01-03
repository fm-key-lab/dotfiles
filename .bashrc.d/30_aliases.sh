alias ll='ls -lah'

alias ..="cd .."
alias ...="cd ../.."

# Can use -f to override interactive nags for destructive disk writes
alias rm="rm -i"
alias mv="mv -i"

# misc
alias commit='git commit'
alias push='git push'
alias st='git st'
alias status='git status'
alias pull='git pull'
alias gping="ssh -T git@github.com"

# Lab
alias dev="cd $HOME/dev"
alias key="cd $GROUP_HOME"
alias me='cd $HOME'

# SLURM
alias srund="srun --mem=16G --time=12:00:00 -p datatransfer --pty bash"
alias sruni="srun -n 1 -p interactive --mem=16G --cpus-per-task=8 --time=1:58:59 --pty bash"

# Other software
alias vsps="ps auwx | grep '[v]scode-server'" # Check for running vscode-server processes

case "$HOSTNAME" in
    meerkatze ) # meerkatze
        alias rawdata='cd /mnt/rawdata' # Raw data directory
        alias dist='echo Debian'        # Get Linux distribution
    ;;
    logan* ) # logan-1
        alias rawdata='cd /mnt/rawdata' # Raw data directory
        alias dist='echo Debian'        # Get Linux distribution
    ;;
    raven* ) # raven01, raven02, ...
        alias kls='klist -c /tmp/krb5cc_$(id -u)_raven*' # Get Kerberos ticket
        alias dist='echo $ID_LIKE'                        # Get Linux distribution (SUSE)
    ;;
    viper* ) # viper01, viper02, ...
        alias kls='klist -c /tmp/krb5cc_$(id -u)_viper*' # Get Kerberos ticket
    ;;
    "" )
        # HOSTNAME is undefined
    ;;
    * ) # Linux default
        # When none of the hostnames match
        alias arch='uname -m'

        # Useful websites
        alias mpg_resources="open https://rena.mpdl.mpg.de/rena/"
        alias oreilly="open https://learning.oreilly.com/home/"
        alias mm="open https://minervamessenger.mpdl.mpg.de"
        alias email="open https://webmail.mpiib-berlin.mpg.de"
        alias docs="open https://docs.mpcdf.mpg.de/doc/computing/viper-user-guide.html"
        alias helpdesk="open https://helpdesk.mpcdf.mpg.de/mpcdf/SelfService/"
        alias nextcloud="open https://transfer.mpiib-berlin.mpg.de/"
    ;;
esac