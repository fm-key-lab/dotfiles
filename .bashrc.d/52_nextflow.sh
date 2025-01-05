#!/bin/bash

# Java memory

export NXF_OPTS='-Xms1g -Xmx4g' # legacy (nf<21)
export NXF_JVM_ARGS='-Xms1g -Xmx4g' # nf>=21

# Containers

export APPTAINERENV_NXF_DEBUG="/ptmp/$USER/apptainer-debug"
export APPTAINERENV_NXF_TASK_WORKDIR="/ptmp/$USER/apptainer-nxf-work"
# export NXF_APPTAINER_CACHEDIR="/ptmp/$USER/apptainer-cache"
export NXF_APPTAINER_CACHEDIR="$GROUP_HOME/containers/nxf-cache"

# backwards compatibility
export SINGULARITYENV_NXF_DEBUG="/ptmp/$USER/apptainer-debug"
export SINGULARITYENV_NXF_TASK_WORKDIR="/ptmp/$USER/apptainer-nxf-work"
# export NXF_SINGULARITY_CACHEDIR="/ptmp/$USER/apptainer-cache"
export NXF_SINGULARITY_CACHEDIR="$GROUP_HOME/containers/nxf-cache"
