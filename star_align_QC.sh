#!/bin/bash

#SBATCH --job-name=STAR_QC
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/STAR_QC.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/STAR_QC.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at


### Environment
module load STAR
module list


### Variables
wd="/lisc/data/scratch/course/2025w300106/massnovits"
outDir="$wd/results/map/STAR_QC"
# defines directories as variables


### Excecution
echo "Started at $(date)"
mkdir -p $outDir

STAR --runThreadN 16 --genomeDir $wd/BosTauris_STAR --readFilesIn $wd/results/trimmomatic/SRR36518525__1P $wd/results/trimmomatic/SRR36518525__2P --outFileNamePrefix $outDir/SRR36518525_QC_BosTaurus_ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate

echo "Finished at $(date)"


#runThreadN: how many CPUs to use
#genomeDir: path to the directory where the genome indices where created
#readFilesIn: path to the fastq files, because of paired end reads there are 2 files and both are needed
#outFileNamePrefix: prefix for the output files
#outSAMstrandField intronMotif: for unstranded RNA-seq library
#outSAMtype: BAM: so the output is a BAM file, and SortedByCoordinate: that it is sorted by coordinates

