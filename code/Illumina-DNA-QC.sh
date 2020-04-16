#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J Illumina_Assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load FastQC/0.11.8

#Quality control 
fastqc \
 data/raw_data/illumina_data/SRR6058604_scaffold_06.*P* \
 --extract \
 --outdir=data/quality_control/
