#  append the history file after each session
shopt -s histappend

#  allow failed commands to be re-edited with Ctrl-R
shopt -s histreedit

#  command substitions are first presented to user before execution
shopt -s histverify

# store multiline commands in a single history entry
shopt -s cmdhist

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

export HISTFILESIZE=10000000
export HISTSIZE=10000000