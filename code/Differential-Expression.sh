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

htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6040092.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6040092_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6040092.count
htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6040093.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6040093_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6040093.count
htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6040094.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6040094_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6040094.count
htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6040096.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6040096_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6040096.count
htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6040097.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6040097_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6040097.count
htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6156066.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6156066_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6156066.count
htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6156067.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6156067_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6156067.count
htseq-count --format=bam --samout=durio_zibethinus_htseq_SRR6156069.sam ~/Genome-Analysis/data/align_data/Transcriptome/star/SRR6156069_scaffoldAligned.sortedByCoord.out.bam ~/Genome-Analysis/data/annotation/durio_zibethinus.all.gtf > durio_zibethinus_htseq_SRR6156069.count



