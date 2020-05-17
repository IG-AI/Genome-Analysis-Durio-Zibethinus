#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -J Differential_Expression
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load htseq

htseq-count --format=bam --samout=durio_zibethinus_htseq.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/durio_zibethinus_transcriptome.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf


