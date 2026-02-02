#!/bin/bash

#SBATCH --job-name=stringtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/stringtie.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/stringtie.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at


### Environment
module load Stringtie
module list


### Variables
wd="/lisc/data/scratch/course/2025w300106/massnovits"
bamFile="/lisc/data/scratch/course/2025w300106/massnovits/results/map/STAR_QC/SRR36518525_QC_BosTaurus_Aligned_filtered.bam"
outDir="$wd/results/stringtie"


### Excecution
echo "Started at $(date)"
mkdir -p $outDir

stringtie $bamFile -l BosTaurus_ -o $outDir/Annotation_BosTaurus.gtf -p 4 -j 5 -g 200 
# input a bam file
#-p 4 CPUs
# -j minimum junction coverage 5
# -g maximum gap allowed between read mappings 200
# -m is by default 200 (minimum input transcript length to include in the merge)
# -l label for output

echo "Finished at $(date)"
