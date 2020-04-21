#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J Transcriptome_BAM-file
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load star
module load trinity

dir=data/raw_data/transcriptome/trimmed

# Generate index
STAR \
 --runMode genomeGenerate \
 --runThreadN 8 \
 --genomeDir data/align_data/Transcriptome/star \
 --genomeFastaFiles data/assemble_data/Illumina/durio_zibethinus.fasta

# Mapping reads
STAR \
 --runThreadN 8 \
 --readFilesIn $dir/SRR6040092_scaffold_06.1.fastq.gz,$dir/SRR6040092_scaffold_06.2.fastq.gz,$dir/SRR6040093_scaffold_06.1.fastq.gz,$dir/SRR6040093_scaffold_06.2.fastq.gz,$dir/SRR6040094_scaffold_06.1.fastq.gz,$dir/SRR6040094_scaffold_06.2.fastq.gz,$dir/SRR6040096_scaffold_06.1.fastq.gz,$dir/SRR6040096_scaffold_06.2.fastq.gz,$dir/SRR6040097_scaffold_06.1.fastq.gz,$dir/SRR6040097_scaffold_06.2.fastq.gz,$dir/SRR6156066_scaffold_06.1.fastq.gz,$dir/SRR6156066_scaffold_06.2.fastq.gz,$dir/SRR6156067_scaffold_06.1.fastq.gz
,$dir/SRR6156067_scaffold_06.2.fastq.gz
,$dir/SRR6156069_scaffold_06.1.fastq.gz
,$dir/SRR6156069_scaffold_06.2.fastq.gz \
 --outFileNamePrefix data/align_data/Transcriptome/star/durio_zibethinus \
 --outSAMtype BAM Unsorted SortedByCoordinate \
 --readFilesCommand gunzip -c \
 --outSAMunmapped None

# Assamble reads
Trinity \
 --genome_guided_bam data/align_data/Transcriptome/star/*.bam \
 --max_memory 25G \
 --CPU 8 \
 --genome_guided_max_intron 10000 \
 --output data/assemble_data/Transcriptome/trinity

# De novo assembly
'
Trinity \
 --seqType fa \
 --max_memory 25G \
 --left data/raw_data/transcriptome/trimmed/*06.1* \
 --right data/raw_data/transcriptome/trimmed/*06.2* \
 --CPU 8 \
 --output data/assemble_data/Transcriptome/trinity
'
