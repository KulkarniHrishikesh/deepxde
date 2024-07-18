#!/bin/bash
#SBATCH --job-name=deepXde_allenCahn
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=72:00:00
#SBATCH --mem=64GB
#SBATCH --output=deepxde_allenCahn%J.log


# Load conda integrated with cuda 
module load cdac/DL_conda_3.7/3.7
eval "$(conda shell.bash hook)"

nvidia-smi #: Cuda 11.4

# Create conda environment once and actiavte from next time
cd /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/
#conda create --name pytorch_env
conda activate deepxde
#Python: 3.9.12.final.0
conda info # to test if the conda envrn is correct
#which python

DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/Allen_Cahn.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/Allen_Cahn.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/Beltrami_flow.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/Burgers.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/Burgers_RAR.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/diffusion_1d_exactBC.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/diffusion_1d.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/diffusion_1d_resample.py
DDE_BACKEND=pytorch python /home/hrishikeshnk/github.copy/deepxde/examples/pinn_forward/diffusion_reaction.py
elasticity_plate.py
Euler_beam.py
filelist.txt
fractional_diffusion_1d.py
fractional_Poisson_1d.py
fractional_Poisson_2d.py
fractional_Poisson_3d.py
heat.py
heat_resample.py
Helmholtz_Dirichlet_2d_HPO.py
Helmholtz_Dirichlet_2d.py
Helmholtz_Neumann_2d_hole.py
Helmholtz_Sound_hard_ABC_2d.py
ide.py
Klein_Gordon.py
Kovasznay_flow.py
Laplace_disk.py
Lotka_Volterra.py
ode_2nd.py
ode_system.py
Poisson_Dirichlet_1d_exactBC.py
Poisson_Dirichlet_1d.py
Poisson_Lshape.py
Poisson_multiscale_1d.py
Poisson_Neumann_1d.py
Poisson_periodic_1d.py
Poisson_PointSetOperator_1d.py
Poisson_Robin_1d.py
Schrodinger.ipynb
Volterra_IDE.py
wave_1d.py