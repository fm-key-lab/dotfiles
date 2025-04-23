#!/bin/bash

# See "Optimizing Nextflow for HPC and cloud at scale" at
# https://seqera.io/blog/optimizing-nextflow-for-hpc-and-cloud-at-scale/

#
# Java virtual machines memory
#

# Provides extra options for the Java and Nextflow runtime. It must be a blank 
# separated list of -Dkey[=value] properties.
export NXF_OPTS='-Xms1g -Xmx4g' # legacy (nf<21)

# Allows the setting Java VM options. This is similar to NXF_OPTS however it’s only 
# applied the JVM running Nextflow and not to any java pre-launching commands.
export NXF_JVM_ARGS='-Xms1g -Xmx4g' # nf>=21.12.1-edge

# Enable the use of virtual threads in the Nextflow runtime (default: false)
# See: https://github.com/nextflow-io/nextflow/discussions/4711
export NXF_ENABLE_VIRTUAL_THREADS=false # nf>=23.05.0-edge
# ^ Also ensure using nextflow with java>=21, which enables
# virtual threads by default.

#
# Containers
#

export APPTAINERENV_NXF_DEBUG="/ptmp/$USER/apptainer-debug"
export SINGULARITYENV_NXF_DEBUG="/ptmp/$USER/apptainer-debug" # backwards compatibility

export APPTAINERENV_NXF_TASK_WORKDIR="/ptmp/$USER/apptainer-nxf-work"
export SINGULARITYENV_NXF_TASK_WORKDIR="/ptmp/$USER/apptainer-nxf-work" # backwards compatibility

# Using a shared location for *_CACHEDIR provides access to containers for 
# local, offline versions of nf-core pipelines
export NXF_APPTAINER_CACHEDIR="$GROUP_HOME/containers/nxf-cache"
export NXF_SINGULARITY_CACHEDIR="$GROUP_HOME/containers/nxf-cache" # backwards compatibility