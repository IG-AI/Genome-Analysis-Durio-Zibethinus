# Genome assembly and analysis of Durio zibethinus
[Genome Analysis (1MB462)](https://www.uu.se/en/admissions/freestanding-courses/course-syllabus/?kKod=1MB462&lasar=), [Uppsala University](https://www.uu.se/en) - Author: Daniel Ågstrand

## Table of Contents
1. [Overview](#Overview)
2. [Goals](#Goals)
3. [Method](#Method)
4. [Data](#Data)
5. [Timeplan](#Timeplan)
6. [Results](#Results)
7. [Discussion](#Discussion)

## Overview
During this project a genome de novo assembly of the Musang King cultivars of Durian, Durio zibethinus species will be performed using PacBio reads which will be corrected with shorter Illumina reads. The quality of the reads will first be assessed and low quality reads will be removed with the help of Canu from the PAcBio reads and the quality of the Illumina reads will be checked with FastQC. If necessary the reads will also go through adapters trimming where the adapter sequence from the 3’-ends will be removed. When this is done the good quality PacBio long reads will be used with Canu to assemble the genome and then the quality of the assembly will be assessed. The trimmed Illumina short read will be assembled thoughter with the assembled PacBio genome as reference with Pilon. Afterward RNA-seq Illumuna short reads from Musang King, Durio zibethinus will be assembled to perform a transcriptome assembly with Trinity1. Then the assembled genome and transcriptome will then be used to perform an automatic structural and functional annotation with the help from Maker2 which also will be manual curated to determine the functional regions and identify genes responsible for producing sulphur odor molecules. The gene products that will be identified as the sulphur odor molecules will later be blast against gene products of the Monthong cultivars of the same species and against Allium cepa (onions), which is also known to produce sulphur molecules to hopefully be able to verify the annotation. A differential expression analysis will then be performed to identify how different regions are expressed under different conditions. First the RNA-Seq reads needs to be mapped to the assembled genome with the software Tophat, then the data from this will be used in HTSeq to count the reads from the mapped geneome. Last the software DESeq2 will be used to calculates the variance-mean dependence in the counted reads expressed under different conditions.

## Goals
Durian is highly sought after fruit in many countries in east and southeast asia. It’s highly nutritious and really tasty, but it also has an odor that has been described as “pig-shit, turpentine and onions, garnished with a gym sock”. Which makes it hard or almost impossible to be introduced to the westen market. But with help of genome analysis the genes responsible for the foul smell could be identified and with help of either gene manipulate those regions so it either could be completely removed or regulated to be expressed less depending on if those genes only are responsible for the odor or if it has some other function as well. Alternative the differential expression analyses could show which conditions would produce less foul odor molecules so Durians could be grown under those conditions to produce less odor molecules. Those GMO or specially grown Durians with a less foul odor or even completely without it could then be introduced to the westen market, so people in the western world also could enjoy those tasty, highly nutritious fruits. 

## Method
### Software
| Software    | Data                         | Analyse                          |
|-------------|------------------------------|----------------------------------|
| Canu | PacBio reads                 | PacBio - Reads Quality Control   |
| FastQC      | Illumina reads               | Illumina - Reads Quality Control |
| Canu        | PacBio reads                 | DNA assembly                     |
| BWA         | PacBio genome, Illumina reads                 | Align Illumina reads to PacBio genome                     |
| Samtools        | Sam file                | Convert Sam file to Bam file                     |
| Pilon	      | PacBio reads and Illumina reads   	             | DNA assembly improvement	        |
| Trinity    | Illumina RNA                 | Transcriptome assembly           |
| Maker      | Eukaryotes information       | Annotation                       |
| Tophat      | Assembled Genome and Illumina RNA      | Map RNA-Seq reads to genome, differential expression |
| HTSeq       | Mapped genome	             | Counting reads mapped to genome, differential expression  |
| Deseq      | Data from HTSeq       | Statistical analysis of HTSeq data, differential expression |
| Blastp      | Protein sequences            | Gene compersion                  |

## Data
1. PacBio long DNA reads of Musang King, Durio zibethinus from the Sequence Read Archive (SRA), NCBI
2. Illumina short DNA reads of Musang King, Durio zibethinus from the Sequence Read Archive (SRA), NCBI
3. Illumina short RNA reads of Musang King, Durio zibethinus from the Sequence Read Archive (SRA), NCBI
4. Protein sequence of sulphur producing odor molecule in Allium cepa from NCBI
5. Protein sequence of sulphur producing odor molecule of Monthong, Durio zibethinus from NCBI

### Data Structure
```
genome_analyses/
|----analyses
|    |----preprocesses
|    |    |----pacBio
|    |    |----illumina
|    |----assembly
|    |    |----pacBio
|    |    |----illumina
|    |----transcriptome_assembly
|    |----annotation
|    |----differential_expression
|    |    |----tophat
|    |    |----htseq
|    |    |----deseq2
|    |----gene compersion
|----code
|    |----PacBio-DNA-Assemble.sh
|    |----Illumina-DNA-Preprocesses.sh
|    |----Illumina-DNA-Assembly.sh
|    |----Transcriptome-Assembly.sh
|    |----Annotation.sh
|    |----Differential-Expression.sh
|    |----Gene-Compersion.sh
|----data
|    |----metadata
|    |----raw_data ->
/proj/g2020008/5_Tean_Teh_2017/
|    |----trimmed_data
|    |----assemble_data
|    |----corrected_data
```

## Timeplan
| Task                                                    | Time period          | Predicted time duration |
|---------------------------------------------------------|----------------------|-------------------------|
| Collect data                                            | 30/03-20 - 05/04-20  | 7 days                  |
| Quality assessment of reads                             | 06/04-20 - 07/04-20  | 2 days                  |
| Adapters trimming                                       | 08/04-20 - 08/04-20  | 1 day                   |
| Genome assembly                                         | 13/04-20 - 19/04-20  | 7 days                  | 
| Genome assembly quality assessment                      | 20/04-20 - 26/04-20  | 7 days                  |
| Transcriptome assembly                                  | 27/04-20 - 03/05-20  | 7 days                  |
| Genome annotation                                       | 04/05-20 - 10/05-20  | 7 days                  |
| Identify and collect sulphur gene productions sequences | 11/05-20 - 14/05-20  | 4 days                  |
| Blast own identified sulphur gene productions against other species sulphur gene productions  | 15/05-20 - 17/05-20  | 3 days |
| Analyse the result and complete the report | 18/05-20 - 23/07-20  | 7 days                  |


## Results

## Discussion

