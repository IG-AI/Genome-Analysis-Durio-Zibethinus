#!/bin/bash -l

SBATCH -A g2020008
SBATCH -p core
SBATCH -n 2
SBATCH -t 24:00:00
SBATCH -J PacBio_Assembly
SBATCH --mail-type=ALL
SBATCH --mail-user daniel.agstrand.5971@student.uu.se

module load bioinfo-tools
module load canu

canu -correct \
  -p durio_zibethinus -d PacBio \
  genomeSize=715.23m \
  executiveThreads=2 \
  -pacbio-raw  /proj/g2020008/5_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_06.fq.gz

canu -trim \
  -p durio_zibethinus -d PacBio \
  genomeSize=715.23m \
  executiveThreads=2 \
  -pacbio-corrected PacBio/durio_zibethinus.correctedReads.fasta.gz

canu -assemble \
  -p durio_zibethinus -d PacBio \
  genomeSize=715.23m \
  correctedErrorRate=0.039 \
  executiveThreads=2 \
  -pacbio-corrected PacBio/durio_zibethinus.trimmedReads.fasta.gz
