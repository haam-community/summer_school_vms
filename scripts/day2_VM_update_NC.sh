#!/usr/bin/env bash

## NOTE: In day 3, the git LFS budget had been spent,
##    so I uploaded all the datasets to nextcloud and had students download them through that.
##    See script day2_VM_update_NC.sh for that code.

cd ~

## qpWave/Adm/Graph dataset
curl -JL https://share.eva.mpg.de/index.php/s/RrBt8QdKGzAbncq/download -o ~/AADR.zip && wait && unzip -d /vol/volume/AADR/ ~/AADR.zip && rm ~/AADR.zip

## Unsupervised analysis dataset
mkdir -p /vol/volume/unsupervised_analyses
curl -JL https://share.eva.mpg.de/index.php/s/qwXm5Ms4n762a56/download -o ~/Data_ADMIX.tar.gz && wait && tar -xzf ~/Data_ADMIX.tar.gz -C /vol/volume/unsupervised_analyses/ && rm ~/Data_ADMIX.tar.gz
curl -JL https://share.eva.mpg.de/index.php/s/Ycr73PLdLJDYQr2/download -o ~/Data_MDS_PCA.tar.gz && wait && tar -xzf ~/Data_MDS_PCA.tar.gz -C /vol/volume/unsupervised_analyses/ && rm ~/Data_MDS_PCA.tar.gz

## ancibd skipped, since it is updated in day 3 anyway.

## Add plink to the path for use in imputation (since it was not added to the environment, as it should have been).
echo 'alias plink="/home/ubuntu/bin/miniconda3/envs/genetic-kinship/bin/plink"' >> ~/.bashrc
