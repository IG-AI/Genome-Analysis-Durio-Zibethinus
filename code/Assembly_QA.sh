#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J Assembly_QA
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load quast 

# PacBio                                                                                                                                                                                                                        
quast.py \
    data/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
    -o data/assemble_data/PacBio/ \
    -R data/assemble_data/Ref/ref_durio_zibethinus.fasta \
    -t 4

# Illumina                                                                                                                                                                                                                       
quast.py \
    data/assemble_data/Illumina/durio_zibethinus.fasta \
    -o data/assemble_data/Illumina/ \
    -R data/assemble_data/Ref/ref_durio_zibethinus.fasta \
    -t 4
