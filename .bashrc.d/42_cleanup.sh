#!/bin/bash

#--------------------------------------------------------------------------
# Clean up the Conda cache
# Globals: none
# Input: nothing
# Output: nothing
function Clean_Conda {
    # See:  https://docs.conda.io/projects/conda/en/stable/commands/clean.html
    echo "Cleaning up conda"
    module load anaconda/3/2023.03
    conda clean --all -y
    module unload anaconda/3/2023.03
} # End of function bar

#--------------------------------------------------------------------------
# Clean up the Nextflow cache
# Globals: none
# Input: nothing
# Output: nothing
function Clean_Nextflow {
    # See:  https://www.nextflow.io/docs/latest/reference/cli.html#clean
    #       https://www.nextflow.io/docs/latest/cache-and-resume.html
    echo "Cleaning up nextflow"
    # TODO: Will error if no workflow executed from HOME
    # module load nextflow
    # nextflow clean -f
    # module unload nextflow
} # End of function bar

#--------------------------------------------------------------------------
# Clean up the renv cache
# Globals: none
# Input: nothing
# Output: nothing
function Clean_Renv {
    # See:  https://rstudio.github.io/renv/articles/package-install.html#cache
    # TODO:
    echo "Cleaning up renv"
} # End of function bar

#--------------------------------------------------------------------------
# Clean up the uv cache
# Globals: none
# Input: nothing
# Output: nothing
function Clean_UV {
    # See:  https://docs.astral.sh/uv/reference/cli/#uv-cache-clean
    #       https://docs.astral.sh/uv/concepts/cache/
    echo "Cleaning up uv"
    module load uv
    uv cache clean
    module unload uv
} # End of function bar

#--------------------------------------------------------------------------
# Clean up the VS Code Server on the remote
# Globals: none
# Input: nothing
# Output: nothing
function Clean_VSCode_Server {
    # See:  https://code.visualstudio.com/docs/remote/troubleshooting#_cleaning-up-the-vs-code-server-on-the-remote
    echo "Cleaning up vs code servers"
    pgrep -u $USER -f "vscode-server" | while read pid; do
        kill -9 $pid
    done
    rm -rf "$HOME/.vscode-server" # Or ~/.vscode-server-insiders
} # End of function CleanupVSCodeServer

#--------------------------------------------------------------------------
# Clean up everything
# Globals: none
# Input: nothing
# Output: nothing
function Clean_Up {
    Clean_VSCode_Server

    # If $HOME quota is exceeded, may have trouble loading modules,
    # so remove vs code server first (no modules required).
    Clean_Conda
    Clean_Nextflow
    Clean_Renv
    Clean_UV
}

function Clean_Up () {
  case "$1" in
    conda)
      Clean_Conda || exit
      ;;
    everything)
      # If $HOME quota is exceeded, may have trouble loading modules,
      # so remove vs code server first (no modules required).
      Clean_VSCode_Server \
      && Clean_Conda \
      && Clean_Nextflow \
      && Clean_Renv \
      && Clean_UV \
      || exit
      ;;
    nextflow)
      Clean_Nextflow || exit
      ;;
    renv)
      Clean_Renv || exit
      ;;
    uv)
      Clean_UV || exit
      ;;
    vscode)
      Clean_VSCode_Server || exit
      ;;
    *)
      echo "Clean_Up: unknown key '$1'"
      return 1
      ;;
  esac
  pwd
}

# Set up tab completion
complete -W "conda everything nextflow renv uv vscode" Clean_Up