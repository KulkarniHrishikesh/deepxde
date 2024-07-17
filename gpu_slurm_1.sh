#!/bin/bash
#SBATCH --job-name=cpu_gpu_comparison
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=10:00
#SBATCH --mem=10GB
#SBATCH --output=deepxde_%J.log

# Load conda integrated with cuda 
module load cdac/DL_conda_3.7/3.7
eval "$(conda shell.bash hook)"

nvidia-smi #: Cuda 11.4

# Create conda environment once and actiavte from next time
cd /home/hrishikeshnk/github.copy/deepxde/
#conda create --name pytorch_env
conda activate deepxde
#Python: 3.9.12.final.0
conda info # to test if the conda envrn is correct
#which python

#python /home/hrishikeshnk/github.copy/CPU_GPU_comparision/NN_autograd.py
#cat /etc/hosts | grep $SLURMD_NODENAME
#python -m pip install torch
#jupyter-lab --ip=0.0.0.0 --port=8888
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/Allen_Cahn.py
