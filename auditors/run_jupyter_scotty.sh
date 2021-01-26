#!/bin/bash
XDG_RUNTIME_DIR=""
ipnport=$(shuf -i8000-9999 -n1)
ipnip=$(hostname -i)

## print tunneling instructions to jupyter-log-{jobid}.txt
echo -e "
    This is your ssh key:
    -----------------------------------------------------------------
    ssh -N -L $ipnport:$ipnip:$ipnport $USER@scotty.princeton.edu
    -----------------------------------------------------------------

    This is your url:
    ------------------------------------------------------------------
    localhost:$ipnport
    ------------------------------------------------------------------
    "

## start an ipcluster instance and launch jupyter server
# At PNI, use pyger
module load pyger/0.11.0
#module load Langs/Python/3.5-anaconda
#module load Pypkgs/brainiak/0.5-anaconda
#module load Pypkgs/NILEARN/0.4.0-anaconda

#module load MPI/OpenMPI
jupyter-notebook --no-browser --port=$ipnport --ip=$ipnip

# (prefix w/ https:// if using password)
