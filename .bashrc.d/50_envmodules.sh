# Environment modules
export MODULE_BASEDIR="$GROUP_HOME/opt"
export MPCDF_DISABLE_MODULE_AVAIL_HINT=1

# NOTE: Can undo using `module unuse "$GROUP_HOME/Modules/modulefiles"`
module use --append "$GROUP_HOME/Modules/modulefiles"