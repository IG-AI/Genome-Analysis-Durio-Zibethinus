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
module load MUMmer

dir="~/Genome-Analysis/data/assemble_data"

# PacBio QUAST                                                                 quast.py \
    $dir/PacBio/durio_zibethinus.contigs.fasta \
    -o $dir/PacBio/ \
    -R $dir/Ref/ref_durio_zibethinus.fasta \
    -t 4

# Illumina QUAST                                                               
quast.py \
    $dir/Illumina/durio_zibethinus.fasta \
    -o $dir/Illumina/ \
    -R $dir/Ref/ref_durio_zibethinus.fasta \
    -t 4

# PacBio MUMmer
nucmer --threads=4 --maxmatch -p durio_zibethinus_pacbio \
    $dir/Ref/ref_durio_zibethinus.fasta \
    $dir/PacBio/default/durio_zibethinus.contigs.fasta

mummerplot --layout -t png --large --filter -p durio_zibethinus_pacbio  \
    durio_zibethinus_pacbio.delta

# Illumina MUMmer
nucmer --threads=4 --maxmatch -p durio_zibethinus_illumina \
    $dir/Ref/ref_durio_zibethinus.fasta \
    $dir/Illumina/durio_zibethinus.fasta

mummerplot --layout -t png --large --filter -p durio_zibethinus_illumina \
    durio_zibethinus_illumina.delta
