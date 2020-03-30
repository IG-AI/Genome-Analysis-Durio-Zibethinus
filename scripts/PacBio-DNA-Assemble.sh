#!/bin/bash

canu -assemble \
  -p durio_zibethinus -d PacBio \
  genomeSize=226.1g \
  correctedErrorRate=0.039 \
  -pacbio-corrected PacBio/durio_zibethinus.trimmedReads.fasta.gz
