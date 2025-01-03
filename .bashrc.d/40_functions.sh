# Usage: 
# $ bib https://doi.org/10.1007/978-0-387-21736-9
function bib {
    # Adapted from:
    # https://github.com/davidagraf/doi2bib2/issues/94#issuecomment-2325203272
    curl --silent -LH "Accept: application/x-bibtex" "$1" | \
      sed -E -e 's/}$/\n}/g' -e 's/^\s//g' -e 's/,\s([a-zA-Z]+=)/,\n    \1/g'
}

function Activate {
    source "$HOME/dev/envs/$1/.venv/bin/activate"
} 

function cpdir {
    while getopts ":h-:" opt; do
        case $opt in
            h)
                echo "Usage: cpdir <source_directory> <destination_directory>"
                echo "Copies a directory and its contents to the specified destination."
                echo "Example: cpdir /path/to/source /path/to/destination"
                return 0
                ;;
            -)
                case "${OPTARG}" in
                    help)
                        echo "Usage: cpdir <source_directory> <destination_directory>"
                        echo "Copies a directory and its contents to the specified destination."
                        echo "Example: cpdir /path/to/source /path/to/destination"
                        return 0
                        ;;
                    *)
                        echo "Unknown option --${OPTARG}"
                        return 1
                        ;;
                esac
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                return 1
                ;;
        esac
    done
    shift $((OPTIND - 1))
    
    rsync -au --progress "$1" "$2"
}

function jobend {
    if [ -z "$1" ]; then
        jobid=$(squeue --noheader -o %A -u $USER | head -n 1)
    else
        jobid=$1
    fi

    scontrol show job $jobid | awk -F'EndTime=' '{print $2}' | awk '{print $1}' | tr -d '\n'
}

# Function to calculate 3/4 of slurm's MaxSubmit and set as an environment variable
function set_max_submit_job_limit {
    max_submit=$(sacctmgr list user "$USER" withassoc format=MaxSubmit | awk 'NR==3 {print $1}')
    if [[ $max_submit =~ ^[0-9]+$ ]]; then
        export SLURM_MAX_SUBMIT_JOB_LIMIT=$((max_submit * 3 / 4))
    else
        echo "Failed to retrieve MaxSubmit. MAXSUBMIT_LIMIT not set."
    fi
}

set_max_submit_job_limit