#!/usr/bin/env bash

mkdir -p /vol/volume/nf-core-eager/data/
cd /vol/volume/nf-core-eager/data/
## FastQs from Penske et al. 2024 https://doi.org/10.1038/s41598-024-54462-6
## Bams from Schroeder et al. 2019 https://doi.org/10.1073/pnas.1820210116
ena_ftp_links=(
    "ftp.sra.ebi.ac.uk/vol1/run/ERR126/ERR12666825/LEU008.A0101.MT1.1_S0_L006_R1_001.fastq.gz" 
    "ftp.sra.ebi.ac.uk/vol1/run/ERR126/ERR12666838/LEU012.A0101.MT1.1_S0_L006_R1_001.fastq.gz" 
    "ftp.sra.ebi.ac.uk/vol1/run/ERR126/ERR12666842/LEU013.A0101.MT1.1_S0_L006_R1_001.fastq.gz"
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503742/Ksiaznice_gr-3ZC_ind-4_final.bam"
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503741/Ksiaznice_gr-3ZC_ind-7_final.bam"
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503747/Mierzanowice-1_gr-3_final.bam"
    )

for fn in ${ena_ftp_links[@]}; do
    wget -L ${fn}
done
