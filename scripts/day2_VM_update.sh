#!/usr/bin/env bash

cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    git clone https://github.com/haam-community/summer_school_vms.git
else
    cd ~/summer_school_vms
    git pull
    cd ~
fi

curl -L https://raw.githubusercontent.com/haam-community/summer_school_vms/refs/heads/main/scripts/get_qpwave_data.sh | bash

## Add plink to the path for use in imputation (since it was not added to the environment, as it should have been).
echo 'alias plink="/home/ubuntu/bin/miniconda3/envs/genetic-kinship/bin/plink"' >> ~/.bashrc

## Then delete the cloned repository, since we don't need it anymore.
rm -r ~/summer_school_vms