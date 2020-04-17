#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J Illumina_Assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.10
module load Pilon/1.22

# Mapping to PacBio referneces genome
bwa index \
 -p data/references_data/PacBio_ref \
 -a bwtsw  \
 data/assemble_data/PacBio/durio_zibethinus.contigs.fasta

bwa mem \
 -t 4 \
 data/references_data/PacBio_ref \
 data/raw_data/illumina_data/SRR6058604_scaffold_06.1P.fastq.gz \
 data/raw_data/illumina_data/SRR6058604_scaffold_06.2P.fastq.gz \ 
 > data/align_data/SRR6058604_scaffold_06.sam

# Convert SAM-file to BAM-file
samtools view \
 -bT \
 data/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
 data/align_data/SRR6058604_scaffold_06.sam \
 > data/align_data/SRR6058604_scaffold_06.bam 

samtools sort \
 -O bam \
 -o data/align_data/SRR6058604_scaffold_06.sorted.bam \
 -T temp data/align_data/SRR6058604_scaffold_06.bam \

samtools index \
 -b \
 data/align_data/SRR6058604_scaffold_06.sorted.bam

# Assemble genome                                                                                  
pilon \
 --genome data/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
 --frags data/align_data/SRR6058604_scaffold_06.sorted.bam \
 --outdir data/assemble_data/Illumina \
 --output durio_zibethinus \
 --threads 4 \
 --changes \
 --diploid
