#!/bin/bash
#SBATCH --job-name=deepXde_all
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=72:00:00
#SBATCH --mem=64GB
#SBATCH --output=deepxde_all%J.log


# Load conda integrated with cuda 
module load cdac/DL_conda_3.7/3.7
eval "$(conda shell.bash hook)"

nvidia-smi #: Cuda 11.4

#conda create --name pytorch_env
conda activate deepxde
#Python: 3.9.12.final.0
conda info # to test if the conda envrn is correct
#which python

# Directory to copy Python scripts for execution
base_dir="/home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/"

# Read each line from filelist.txt
while IFS= read -r filename; do
    # Remove leading and trailing whitespace (if any)
    filename=$(echo "$filename" | tr -d '[:space:]')

    # Remove file extension (.py) from the filename
    folder="${filename%.py}"
    #echo "$folder"

    # Copy Python script to scripts_to_run_dir
    mv "$base_dir$folder/$filename" "$base_dir/"

    # Change directory to scripts_to_run_dir
    cd "$base_dir" || exit
    # printf '%s\n' *.py 
    
    # Loop through Python scripts in the folder
    DDE_BACKEND=pytorch python "$base_dir$filename"
    
    # move output files
    find ./ -type f -maxdepth 1 -print0 | xargs -0 mv -t "$base_dir$folder/"

    # move Python script to scripts_to_run_dir
    mv "$base_dir$filename" "$base_dir$folder/"
    
done < filelist