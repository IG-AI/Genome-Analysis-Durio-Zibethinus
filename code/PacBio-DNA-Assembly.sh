#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J PacBio_Assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load canu
module load samtools/1.10

canu -correct \
  -p durio_zibethinus -d data/corrected_data \
  genomeSize=26551601 \
  executiveThreads=8 \
  executiveMemory=25.6 \
  -pacbio-raw  data/raw_data/pacbio_data/SRR6037732_scaffold_06.fq.gz

canu -trim \
  -p durio_zibethinus -d data/trimmed_data \
  genomeSize=26551601 \
  executiveThreads=8 \
  executiveMemory=25.6 \
  -pacbio-corrected data/corrected_data/durio_zibethinus.correctedReads.fasta.gz

canu -assemble \
  -p durio_zibethinus -d data/assemble_data \
  genomeSize=26551601 \
  executiveThreads=8 \
  executiveMemory=25.6 \
  -pacbio-corrected data/trimmed_data/durio_zibethinus.trimmedReads.fasta.gz

samtools faidx \
 data/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
 -o data/assemble_data/PacBio/durio_zibethinus.contigs.fai
