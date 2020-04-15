#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J Generete_BAM_file
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.10

# Generate BAM-file
bwa index \
 -p data/references_data/PacBio_ref \
 -a bwtsw  \
 data/assemble_data/PacBio/durio_zibethinus.contigs.fasta

bwa aln \
 -t 4 \
 data/references_data/PacBio_ref \
 data/raw_data/illumina_data/SRR6058604_scaffold_06.1P.fastq.gz > data/align_data/SRR6058604_scaffold_06.1P.sai

bwa aln \
 -t 4 \
 data/references_data/PacBio_ref \
 data/raw_data/illumina_data/SRR6058604_scaffold_06.2P.fastq.gz > data/align_data/SRR6058604_scaffold_06.2P.sai

bwa sampe \
 data/references_data/PacBio_ref \
 data/align_data/SRR6058604_scaffold_06.1P.sai \
 data/align_data/SRR6058604_scaffold_06.2P.sai \
 data/raw_data/illumina_data/SRR6058604_scaffold_06.1P.fastq.gz \
 data/raw_data/illumina_data/SRR6058604_scaffold_06.2P.fastq.gz > data/align_data/SRR6058604_scaffold_06.sam

samtools view \
 -bT \
 data/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
 data/align_data/SRR6058604_scaffold_06.sam > data/align_data/SRR6058604_scaffold_06.bam 

