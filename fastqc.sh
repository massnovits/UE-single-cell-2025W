#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/fastqc.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/fastqc.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at

### Environment
module load FastQC

### Variables
outDir="/lisc/data/scratch/course/2025w300106/massnovits/results/fastqc"
readsDir="/lisc/data/scratch/course/2025w300106/massnovits"

### Excecution
echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir  $readsDir/SRR36518525_1.fastq $readsDir/SRR36518525_2.fastq
echo "Job finished at $(date)"


#-t 2:number of threads, here 2
#-o: output directory, here as a variable, it doesnt already exist, needs to be created before -> mkdir
#path to the reads is provided
