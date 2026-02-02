#!/bin/bash

#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=4:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/trimmomatic.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/trimmomatic.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at


### Environment
module load Trimmomatic
module list


###Variables
wd="/lisc/data/scratch/course/2025w300106/massnovits"
outDir="$wd/results/trimmomatic"


### Excecution
echo "Started at $(date)"
mkdir -p $outDir

trimmomatic PE -threads 4 -summary $outDir/SRR36518525_summary.txt $wd/SRR36518525_1.fastq $wd/SRR36518525_2.fastq -baseout $outDir/SRR36518525_ ILLUMINACLIP:$wd/trim_adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:75

echo "Finished at $(date)"

#PE: paired end mode
#-threads 4: uses 4 CPUs
#-summary: put the summary file in the given directory, with the following name
#both fastq files are provided
#-baseout: given output directory with given prefix to files

#Illuminaclip: removes the adaptors, based on the ones specified in the fasta file
#:2:30:10 
#seedmismatch (allows here max. 2 mismatches in the initial seed),
#palindrome clip threshold (specifies how accurate the match between the two 'adapter ligated' reads must be), 
#simple clip threshold (pecifies how accurate the match between any adapter etc. sequence must be against a read)

#slidingwindow:4:20 -> window size of 4, must have average phred quality of at least 20
#Minlen:75 -> keep only reads with minimal lenght of 75 (depends on the lenght that illumina produced, here 150)
