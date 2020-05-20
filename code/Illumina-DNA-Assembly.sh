#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J Illumina_Assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load bwa
module load samtools
module load Pilon

dir='~/Genome-Analysis/data'

# Mapping to PacBio referneces genome
bwa index \
 -p $dir/references_data/PacBio_ref \
 -a bwtsw  \
 $dir/assemble_data/PacBio/durio_zibethinus.contigs.fasta

bwa mem \
 -t 4 \
 $dir/references_data/PacBio_ref \
 $dir/raw_data/illumina_data/SRR6058604_scaffold_06.1P.fastq.gz \
 $dir/raw_data/illumina_data/SRR6058604_scaffold_06.2P.fastq.gz \ 
 > $dir/align_data/SRR6058604_scaffold_06.sam

# Convert SAM-file to BAM-file
samtools view \
 -bT \
 $dir/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
 $dir/align_data/SRR6058604_scaffold_06.sam \
 > $dir/align_data/SRR6058604_scaffold_06.bam 

samtools sort \
 -O bam \
 -o $dir/align_data/SRR6058604_scaffold_06.sorted.bam \
 -T temp data/align_data/SRR6058604_scaffold_06.bam \

samtools index \
 -b \
 $dir/align_data/SRR6058604_scaffold_06.sorted.bam

# Assemble genome                                                                                  
pilon \
 --genome $dir/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
 --frags $dir/align_data/SRR6058604_scaffold_06.sorted.bam \
 --outdir $dir/assemble_data/Illumina \
 --output durio_zibethinus \
 --threads 4 \
 --changes \
 --diploid
