#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J Transcriptome_Assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load star
module load trinity

# Generate index

STAR \
 --runMode genomeGenerate \
 --runThreadN 8 \
 --genomeDir data/align_data/Transcriptome/star \
 --genomeSAindexNbases 13 \
 --genomeFastaFiles data/assemble_data/Illumina/durio_zibethinus.fasta 

# Mapping reads

files=( $(ls -d /home/daniagst/Genome-Analysis/data/raw_data/transcriptome/trimmed/*06.*.*) )

for (( i=0; i<${#files[@]} ; i+=2 )) ;
do
    p1=$(echo "${files[i]}")
    p2=$(echo "${files[i+1]}")
    filename=${p1##*trimmed/}
    filename=${filename%_06*}

    STAR \
	--runThreadN 8 \
	--limitBAMsortRAM 2616557322 \
	--genomeDir data/align_data/Transcriptome/star \
	--readFilesIn $p1 $p2 \
        --readFilesCommand gunzip -c \
        --outFileNamePrefix data/align_data/Transcriptome/star/$filename \
	--outSAMtype BAM SortedByCoordinate \
	--outSAMunmapped None

    # Assamble reads
    Trinity \
	--genome_guided_bam data/align_data/Transcriptome/star/$filename*.bam \
	--max_memory 25G \
	--CPU 8 \
	--genome_guided_max_intron 10000 \
	--output data/assemble_data/Transcriptome/$filename-trinity

    ls data/assemble_data/Transcriptome/$filename-trinity/* -d | grep -v '.fasta' | xargs rm -rf
done
