#!/bin/bash

# Default profile:
#
#   > The default profile to use when no --profile argument is specified can also 
#     be set via the environment variable SNAKEMAKE_PROFILE, e.g. by specifying 
#     export SNAKEMAKE_PROFILE=myprofile in your ~/.bashrc or the system wide shell 
#     defaults means that the --profile flag can be omitted. In order unset the 
#     profile defined by this environment variable for individual runs without 
#     specifying and alternative profile you can provide the special value none, 
#     i.e. --profile none.

case "$HOSTNAME" in
  # raven01, raven02, ...
  raven* )
    export SNAKEMAKE_PROFILE="$GROUP_HOME/config/snakemake/profiles/raven"
  ;;
  # viper01, viper02, ...
  viper* )
    export SNAKEMAKE_PROFILE="$GROUP_HOME/config/snakemake/profiles/viper"
  ;;
esac

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

# WebDAV storage plug-in:
#
# URL: https://snakemake.github.io/snakemake-plugin-catalog/plugins/storage/webdav.html

# For MPIIB NextCloud
export SNAKEMAKE_STORAGE_WEBDAV_USERNAME=""
export SNAKEMAKE_STORAGE_WEBDAV_PASSWORD=""

extract_netrc_to_smk_webdav() {
  export SNAKEMAKE_STORAGE_WEBDAV_USERNAME="$USER"
  export SNAKEMAKE_STORAGE_WEBDAV_PASSWORD=$(awk '
    $1 == "machine" && $2 == "transfer.mpiib-berlin.mpg.de" { in_machine = 1 }
    in_machine && $1 == "password" { print $2; exit }
  ' ~/.netrc)
}

case "$HOSTNAME" in
  # raven01, raven02, ..., viper01, viper02, ...
  raven*|viper* )
    extract_netrc_to_smk_webdav
  ;;
esac