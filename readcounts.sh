#!/bin/bash

#SBATCH --job-name=readcounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/readcounts.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/readcounts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at


### Environment
module load Subread
module list


### Variables
wd="/lisc/data/scratch/course/2025w300106/massnovits"
gtfFile="/lisc/data/scratch/course/2025w300106/massnovits/test.gtf"
bamFile="/lisc/data/scratch/course/2025w300106/massnovits/results/map/STAR_QC/SRR36518525_QC_BosTaurus_Aligned_filtered.bam"



### Excecution
echo "Started at $(date)"
featureCounts -p --countReadPairs -C -T 4 --primary -a $gtfFile -o $wd/results/SRR36518525_counts.tsv $bamFile
echo "Finished at $(date)"


# -p for paired end reads
# --countReadPairs fragments (or templates) will be counted instead of reads
# --primary Count primary alignments only
# -C Do not count read pairs that have their two ends mapping to different chromosomes or mapping to same chromosome but on different strands.
# -T is the amount of threads to use
#-a input of gtf file

