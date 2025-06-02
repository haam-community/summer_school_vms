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
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503727/Koszyce-3_3_final.bam"
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503726/Koszyce-3_2_final.bam"
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503730/Koszyce-3_6_final.bam"
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503734/Koszyce-3_10_final.bam"
    "ftp.sra.ebi.ac.uk/vol1/run/ERR350/ERR3503735/Koszyce-3_11_final.bam"
    )

for fn in ${ena_ftp_links[@]}; do
    wget -L ${fn}
done

## Also download the prepared samplesheets
wget https://raw.githubusercontent.com/haam-community/summer_school_vms/refs/heads/main/data/eager/samplesheet_{sg,mt}.tsv

mkdir -p /vol/volume/nf-core-eager/reference
cd /vol/volume/nf-core-eager/reference
## Download the hs37d5 reference genome
wget ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference//phase2_reference_assembly_sequence/hs37d5.fa.gz

if [[ $(md5sum hs37d5.fa.gz | awk '{print $1}') == "a07c7647c4f2e78977068e9a4a31af15" ]]; then
    ## This gives a warning "decompression OK, trailing garbage ignored". That's fine.
    gzip -d hs37d5.fa.gz
    if [[ $(md5sum hs37d5.fa | awk '{print $1}') != "12a0bed94078e2d9e8c00da793bbc84e" ]]; then
        echo "'hs37d5.fa': md5sum mismatch, please check the file"
    fi
else
    echo "'hs37d5.fa.gz': md5sum mismatch, please check the file"
fi

## Download the 1240K hs37d5 snp and bed files and their md5sums
wget https://raw.githubusercontent.com/haam-community/summer_school_vms/refs/heads/main/data/eager/1240K_hs37d5.{bed.gz,snp.gz,md5}

md5sum -c 1240K_hs37d5.md5
if [[ $? -ne 0 ]]; then
    echo "'1240K_hs37d5.bed.gz' or '1240K_hs37d5.snp.gz': md5sum mismatch, please check the files"
else
    gzip -d 1240K_hs37d5.bed.gz
    gzip -d 1240K_hs37d5.snp.gz
fi
