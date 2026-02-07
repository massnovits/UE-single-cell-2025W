# UE-single-cell-2025W
Scripts from the single cell course

## Contents of repository

|File|Description|
|----|-----------|
|star_align.sh|aligns RNA sequencing data to an indexed reference genome, uses raw fastq files|
|fastqc.sh|performs quality control on provided fastq files. Output files in .html format contain information about sequencing quality and content|
|trimmomatic.sh|trims fastq files - removes adapters and sequences below a quality threshold defined in the script|
|star_align_QC.sh|aligns RNA sequencing data to an indexed reference genome, uses fastq files after quality control steps with trimmomatic|
|readcounts.sh|input is a .gtf (contains genome annotation) and a bam file containing aligned RNA sequencing reads, gene expression is quantified by counting the reads that overlap with the annotated features|
|stringtie.sh|assmebles transcripts, provided from the bam file and outputs a .gtf file|
|readcounts_new.sh|same as readcounts.sh, but uses the assambly created with stringtie.as as the .gtf file|
|emapper.sh|produces a genome annotation by using protein sequences and finding orthologs|
|cellranger.sh|processes single cell sequencing data and generates gene expression counts. The generated data can be used for further downstream analysis e.g. with Seurat|
