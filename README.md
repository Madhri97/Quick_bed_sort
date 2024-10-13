BED File Sorter
This project sorts and merges BED files based on chromosome selection, facilitating easier data analysis for genomic studies. It uses Snakemake for workflow management and efficiently processes the input data.

Prerequisites
To use this script, you'll need:

Snakemake: For workflow management.
Unix-based command-line tools: Including zcat and awk.
Python: For executing the Snakemake script.
Files
quick_sort_bed.smk: The Snakemake workflow file that defines the rules for sorting and merging BED files.
standard_selection.tsv: A tab-separated file listing the chromosomes to process.
Usage
Prepare Input Data
The input files should be in BED format, for example, data2/shuf.a.bed.gz.

Running the Script
Use the following command to execute the sorting and merging process:

bash
Copy code
snakemake -s quick_sort_bed.smk --cores 1
This command will sort the input BED files based on the specified chromosomes and output a merged BED file.

Output
sample_X_merged.bed: The sorted and merged BED file based on the selected chromosomes.
