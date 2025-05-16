#!/bin/bash
# shellcheck disable=SC2086
# shellcheck disable=SC2162

#--------------------------------------------------------------------------
# Clean up the Conda cache
# Globals: none
# Input: nothing
# Output: nothing
function __Clean_Conda {
    # See:  https://docs.conda.io/projects/conda/en/stable/commands/clean.html
    echo "Cleaning up conda"
    module load anaconda/3/2023.03
    conda clean --all -y
    module unload anaconda/3/2023.03
}

#--------------------------------------------------------------------------
# Clean up the Nextflow cache
# Globals: none
# Input: nothing
# Output: nothing
function __Clean_Nextflow {
    # See:  https://www.nextflow.io/docs/latest/reference/cli.html#clean
    #       https://www.nextflow.io/docs/latest/cache-and-resume.html
    echo "Cleaning up nextflow"
    # TODO: Will error if no workflow executed from HOME
    # module load nextflow
    # nextflow clean -f
    # module unload nextflow
}

#--------------------------------------------------------------------------
# Clean up the renv cache
# Globals: none
# Input: nothing
# Output: nothing
function __Clean_Renv {
    # See:  https://rstudio.github.io/renv/articles/package-install.html#cache
    # TODO:
    echo "Cleaning up renv"
}

#--------------------------------------------------------------------------
# Clean up the uv cache
# Globals: none
# Input: nothing
# Output: nothing
function __Clean_UV {
    # See:  https://docs.astral.sh/uv/reference/cli/#uv-cache-clean
    #       https://docs.astral.sh/uv/concepts/cache/
    echo "Cleaning up uv"
    module load uv
    uv cache clean
    module unload uv
}

#--------------------------------------------------------------------------
# Clean up the VS Code Server on the remote
# Globals: none
# Input: nothing
# Output: nothing
function __Clean_VSCode_Server {
    # See:  https://code.visualstudio.com/docs/remote/troubleshooting#_cleaning-up-the-vs-code-server-on-the-remote
    echo "Cleaning up vs code servers"
    pgrep -u $USER -f "vscode-server" | while read pid; do
        kill -9 $pid
    done
    rm -rf "$HOME/.vscode-server" # Or ~/.vscode-server-insiders
}

#--------------------------------------------------------------------------
# Clean up everything
# Globals: none
# Input: nothing
# Output: nothing
function Cleanup () {
  case "$1" in
    conda)
      __Clean_Conda || exit
      ;;
    everything)
      # If $HOME quota is exceeded, may have trouble loading modules,
      # so remove vs code server first (no modules required).
      __Clean_VSCode_Server \
      && __Clean_Conda \
      && __Clean_Nextflow \
      && __Clean_Renv \
      && __Clean_UV \
      || exit
      ;;
    nextflow)
      __Clean_Nextflow || exit
      ;;
    renv)
      __Clean_Renv || exit
      ;;
    uv)
      __Clean_UV || exit
      ;;
    vscode)
      __Clean_VSCode_Server || exit
      ;;
    *)
      echo "Cleanup: unknown key '$1'"
      return 1
      ;;
  esac
  pwd
}

# Set up tab completion
complete -W "conda everything nextflow renv uv vscode" Cleanup