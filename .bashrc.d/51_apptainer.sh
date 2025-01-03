# Containers

# TODO: Use a config file, set up per descriptions [here](https://apptainer.org/docs/user/main/bind_paths_and_mounts.html#bind-paths-and-mounts)

# NOTE: Should not use `\tmp` (see [here](https://docs.mpcdf.mpg.de/doc/computing/raven-user-guide.html#tmp))

export APPTAINER_TMPDIR="/ptmp/$USER/apptainer-build" # NOTE that these get overwritten by MPCDFs apptainer modulefiles
export APPTAINERENV_TMPDIR="/ptmp/$USER/apptainer-build"

export SINGULARITYENV_TMPDIR="/ptmp/$USER/apptainer-build" # backwards compatibility