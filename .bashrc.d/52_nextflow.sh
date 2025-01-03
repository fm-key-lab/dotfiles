#!/bin/bash

export APPTAINERENV_NXF_DEBUG="/ptmp/$USER/apptainer-debug"
export SINGULARITYENV_NXF_DEBUG="/ptmp/$USER/apptainer-debug" # backwards compatibility

export NXF_OPTS='-Xms1g -Xmx4g' # legacy (nf<21)
export NXF_JVM_ARGS='-Xms1g -Xmx4g' # nf>=21

# TODO: Not sure which is best here ...

# export NXF_SINGULARITY_CACHEDIR="/ptmp/$USER/apptainer-cache"
# export NXF_APPTAINER_CACHEDIR="/ptmp/$USER/apptainer-cache"

export NXF_SINGULARITY_CACHEDIR="$GROUP_HOME/containers/nxf-cache"
export NXF_APPTAINER_CACHEDIR="$GROUP_HOME/containers/nxf-cache"