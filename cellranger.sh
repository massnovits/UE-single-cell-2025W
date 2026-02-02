#!/bin/bash

#SBATCH --job-name=cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/massnovits/logs/cellranger.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/massnovits/logs/cellranger.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12130719@unet.univie.ac.at


### Environment
module load CellRanger
module list


### Variables
wd="/lisc/data/scratch/course/2025w300106"
index="${wd}/common/NV2_fluo"
fastq_dir="${wd}/common/blastula.12h/run1,${wd}/common/blastula.12h/run2,${wd}/common/blastula.12h/run3"
sample="89085"
od="${wd}/massnovits/results/cellranger"
id="blastula_12"


### Excecution
echo "Started at $(date)"

mkdir -p ${od}
#create output directory
cd ${od}

cellranger count --transcriptome $index --fastqs $fastq_dir --sample $sample --force-cells 10000 --nosecondary --localcores 16 --id $id --create-bam false

#count: count  gene expression and/or feature barcode reads from a single sample
#--transcriptome is the path to the folder with the transcriptome reference
#--fastqs  Path to input FASTQ files
#--sample Prefix of the filenames of FASTQs to select
#--force-cells force to use this amount of cells (here 10000)
#--nosecondary disable secondary analysis
#--localcores amount of cpus to use
#--id unique run id and output folder name
#--create-bam whether or not to create a bam file (here false, because not needed)

echo "Finished at $(date)"
