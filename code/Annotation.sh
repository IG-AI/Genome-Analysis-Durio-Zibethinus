#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 24:00:00
#SBATCH -J Annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load maker 

maker -c 12 maker_opts.ctl maker_bopts.ctl maker_exe.ctl
