#!/bin/bash

#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/STAR.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/STAR.%j.er
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at


### Environment
module load STAR
module list


### Excecution
STAR --runThreadN 16 --genomeDir /lisc/data/scratch/course/2025w300106/massnovits/BosTauris_STAR --readFilesIn /lisc/data/scratch/course/2025w300106/massnovits/SRR36518525_1.fastq /lisc/data/scratch/course/2025w300106/massnovits/SRR36518525_2.fastq --outFileNamePrefix /lisc/data/scratch/course/2025w300106/massnovits/results/map/SRR36518525_BosTauris_ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate

#runThreadN is the number of CPUs
#genomeDir: path to the directory where the genome indices where created
#readFilesIn: path to the fastq files, because of paired end reads there are 2 files and both are needed
#outFileNamePrefix: prefix for the output files
#outSAMstrandField intronMotif: for unstranded RNA-seq library
#outSAMtype: BAM: so the output is a BAM file, and SortedByCoordinate: that it is sorted 
