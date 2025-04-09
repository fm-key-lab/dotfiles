#!/bin/bash

export EDITOR="/usr/bin/vi"

#
# Directories
#

export GROUP_HOME="/nexus/posix0/MPIIB-keylab"

export PUBLIC_DATA="${GROUP_HOME}/public_data"
export REFERENCE_GENOMES="${GROUP_HOME}/public_data/reference_genomes"
export DATABASES="${GROUP_HOME}/public_data/databases"

# NOTE: None of these are set on machine, despite their pervasive usage in 
#       software (which default to /tmp) and the MPCDF's directive to not use 
#       /tmp and instead use /ptmp.
export TEMP="/ptmp/${USER}"
export TMP="/ptmp/${USER}"
export TMPDIR="/ptmp/${USER}"

#
# Configuration
#

# Java defaults
export JVM_MEM="-Xmx4g"

# Slurm defaults (applies on login nodes)
# NOTE: Setting a default for `SLURM_CPUS_PER_TASK` is not recommended, as it
#       can lead to unexpected behavior when running jobs on the login nodes,
#       e.g., when using `srun` with `--cpus-per-task=8` will lead to warning: 
#       `srun: Job step's --cpus-per-task value exceeds that of job (8 > 2). Job step may never run.`
#
#       In most cases, this will not be fatal. An exception is when using
#       the RVS/JNaaS on MPCDF.
#
#       It is recommended to set this variable in the job script itself.
export SLURM_CPUS_PER_TASK=2
export SLURM_MEM_PER_NODE=1200

# Default location for Slurm job logs
export SLURM_LOG="/ptmp/${USER}/slurm/logs"
mkdir -p $SLURM_LOG

#
# Executables
#

export DUCKDB="$GROUP_HOME/opt/duckdb/1.0.0"