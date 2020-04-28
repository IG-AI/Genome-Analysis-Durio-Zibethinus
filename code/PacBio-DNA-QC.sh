#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J PacBio_QC
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load FastQC/0.11.8

#Quality control 
fastqc \
 data/raw_data/pacbio_data/SRR6037732_scaffold_06.fq.gz \
 --extract \
 --outdir=data/quality_control/
