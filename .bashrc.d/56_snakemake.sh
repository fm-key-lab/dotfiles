#!/bin/bash

# 
# Snakemake
#

# Default profile:
#
#   > The default profile to use when no --profile argument is specified can also 
#     be set via the environment variable SNAKEMAKE_PROFILE, e.g. by specifying 
#     export SNAKEMAKE_PROFILE=myprofile in your ~/.bashrc or the system wide shell 
#     defaults means that the --profile flag can be omitted. In order unset the 
#     profile defined by this environment variable for individual runs without 
#     specifying and alternative profile you can provide the special value none, 
#     i.e. --profile none.

export SNAKEMAKE_PROFILE="$GROUP_HOME/config/snakemake/profiles/viper"

# Temp directory:
# 
#   > --default-resources, --default-res
#     Define default values of resources for rules that do not define their own 
#     values. In addition to plain integers, python expressions over inputsize are 
#     allowed (e.g. `2*input.size_mb`). The inputsize is the sum of the sizes of 
#     all input files of a rule. By default, Snakemake assumes a default for 
#     mem_mb, disk_mb, and tmpdir (see below). This option allows to add further 
#     defaults (e.g. account and partition for slurm) or to overwrite these 
#     default values. The defaults are `mem_mb=min(max(2*input.size_mb, 1000), 8000)`, 
#     `disk_mb=max(2*input.size_mb, 1000)` (i.e., default disk and mem usage is 
#     twice the input file size but at least 1GB), and the system temporary 
#     directory (as given by $TMPDIR, $TEMP, or $TMP) is used for the tmpdir 
#     resource. The tmpdir resource is automatically used by shell commands, 
#     scripts and wrappers to store temporary data (as it is mirrored into $TMPDIR, 
#     $TEMP, and $TMP for the executed subprocesses). If this argument is not 
#     specified at all, Snakemake just uses the tmpdir resource as outlined above.