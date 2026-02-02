#!/bin/bash

#SBATCH --job-name=eggnogmapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/emapper.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/emapper.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at


### Environment
module load eggnogmapper
module list


### Variables
wd="/lisc/data/scratch/course/2025w300106/massnovits"
outDir="${wd}/results/emapper"


### Excecution
echo "Started at $(date)"

mkdir -p ${outDir}
#create output directory

emapper.py -i ${wd}/proteins_corrected.fasta --itype proteins -o BosTaurus_  --output_dir ${outDir} --cpu 16 --evalue 0.005 --go_evidence experimental --override

# its better to write the variables with {} 
#-i input
#--itype type of input
#-m search options (use default: m) search queries using Diamond
#--tax_scope default:auto starts narrow based on your input and then broadens the scope
#--evalue e-value threshold
#--go_evidence experimental: use only experimentally inferred terms

echo "Finished at $(date)"
