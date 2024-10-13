import pandas as pd

# Load chromosome selection file
SELECTION_FILE = "standard_selection.tsv"
selection_file = pd.read_csv(SELECTION_FILE, header=None, sep="\t")

# Get the list of chromosomes in the order specified by the selection file
chromosomes = selection_file[0].str.strip().tolist()

# Rule to specify the final desired output (merged BED file)
rule all:
    input:
        "sorted_bed_file_per_sample/sample_X_merged.bed"

# Combined rule to split, sort, and merge by chromosome
rule process_and_merge:
    input:
        runs=["data2/shuf.a.bed.gz", "data2/shuf.b.bed.gz"]  # Input BED files
    output:
        "sorted_bed_file_per_sample/sample_X_merged.bed"
    shell:
        """
        > {output}

        for chrom in {chromosomes}; do
            zcat {input.runs} | awk '$1 == "'$chrom'"' | sort -k2,2n -k3,3n >> {output}
        done
        """

