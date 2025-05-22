#!/usr/bin/env bash

mkdir -p /vol/volume/admixtools2/
cd /vol/volume/admixtools2/

## Download the provided zip archives
wget https://github.com/haam-community/summer_school_vms/raw/refs/heads/main/data/admixtools2/{f,twig}stats_example.tgz

if [[ $(md5sum fstats_example.tgz | awk '{print $1}') == "a8a9e27cd5f204b7810c291255c4d535" ]]; then
    tar -xf fstats_example.tgz 2>/dev/null
    if [[ $? -eq 0 ]]; then
        echo "'fstats_example.tgz' extracted successfully"
        rm fstats_example.tgz
    fi
else
    echo "'fstats_example.tgz': md5sum mismatch, please check the file"
fi

if [[ $(md5sum twigstats_example.tgz | awk '{print $1}') == "dc42e2eaf4cb23e8bf5cfadc67ae3b5f" ]]; then
    tar -xf twigstats_example.tgz 2>/dev/null
    if [[ $? -eq 0 ]]; then
        echo "'twigstats_example.tgz' extracted successfully"
        rm twigstats_example.tgz
    fi
else
    echo "'twigstats_example.tgz': md5sum mismatch, please check the file"
fi

