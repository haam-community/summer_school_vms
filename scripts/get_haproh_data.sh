#!/usr/bin/env bash

mkdir -p /vol/volume/packages-poseidon/
## First, download the 2023_Skourtanioti_Aegean-1.0.1 poseidon package into the packages_poseidon directory.
trident fetch -d /vol/volume/packages-poseidon -f '*2023_Skourtanioti_Aegean-1.0.1*'

## Then pull VM_resources repo with git lfs and extract the 1000G HDF5 files for haproh, adn the day3_package.
cd ~
git clone https://github.com/haam-community/summer_school_vms.git & git lfs pull

## Copy over day_3 package
cp -r ~/summer_school_vms/data/day3_pkg/ /vol/volume/packages-poseidon/

## Then download the 1000G HDF5 files for for haproh.
mkdir -p /vol/volume/haproh/data

tar -xzf ~/summer_school_vms/data/haproh/1000g1240khdf5.tar.gz -C /vol/volume/haproh

cd /vol/volume/haproh/data

ena_ftp_links=(
    "ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR106/ERR10675925/HGC011.dslib_rmdup.q30.bam"
    "ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR106/ERR10675925/HGC011.dslib_rmdup.q30.bam.bai"
    )

for fn in ${ena_ftp_links[@]}; do
    wget -L ${fn}
done
