#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 12:00:00
#SBATCH -J Transcriptome_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load trinity/2.9.1

Trinity \
 --seqType fa \
 --max_memory 25G \
 --left data/raw_data/transcriptome/trimmed/*06.1* \
 --right data/raw_data/transcriptome/trimmed/*06.2* \
 --CPU 8 \
 --output data/assemble_data/Transcriptome/trinity
