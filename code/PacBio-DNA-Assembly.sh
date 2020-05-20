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
module load samtools

dir=~/Genome-Analysis/data

# Default option for minOverlapLength=500 and correctedErrorRate=0.045 

canu -correct \
  -p durio_zibethinus_high_sense -d $dir/corrected_data/ \
  genomeSize=26551601 \
  executiveThreads=8 \
  executiveMemory=25.6 \
  useGrid=remote \
  minOverlapLength=600 \
  -pacbio-raw $dir/raw_data/pacbio_data/SRR6037732_scaffold_06.fq.gz

canu -trim \
  -p durio_zibethinus_high_sense -d $dir/trimmed_data/ \
  genomeSize=26551601 \
  executiveThreads=8 \
  executiveMemory=25.6 \
  useGrid=remote \
  minOverlapLength=600 \
  correctedErrorRate=0.040 \
  -pacbio-corrected $dir/corrected_data/durio_zibethinus_high_sense.correctedReads.fasta.gz

canu -assemble \
  -p durio_zibethinus_high_sense -d $dir/assemble_data/PacBio/high_sense \
  genomeSize=26551601 \
  executiveThreads=8 \
  executiveMemory=25.6 \
  useGrid=remote \
  minOverlapLength=600 \
  correctedErrorRate=0.040 \
  -pacbio-corrected $dir/trimmed_data/durio_zibethinus_high_sense.trimmedReads.fasta.gz

samtools faidx \
 $dir/assemble_data/PacBio/durio_zibethinus.contigs.fasta \
 -o $dir/assemble_data/PacBio/durio_zibethinus.contigs.fai
