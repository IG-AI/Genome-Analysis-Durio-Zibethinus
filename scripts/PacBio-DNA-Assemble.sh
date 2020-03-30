#!/bin/bash

canu -correct \
  -p durio_zibethinus -d PacBio \
  genomeSize=226.1g \
  -pacbio-raw  /proj/g2020008/5_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_06.fq.gz

canu -trim \
  -p durio_zibethinus -d PacBio \
  genomeSize=226.1g \
  -pacbio-corrected PacBio/durio_zibethinus.correctedReads.fasta.gz

canu -assemble \
  -p durio_zibethinus -d PacBio \
  genomeSize=226.1g \
  correctedErrorRate=0.039 \
  -pacbio-corrected PacBio/durio_zibethinus.trimmedReads.fasta.gz
