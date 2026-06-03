#!/usr/bin/env bash

## NOTE: In day 3, the git LFS budget had been spent,
##    so I uploaded all the datasets to nextcloud and had students download them through that.
##    See script day3_VM_update_NC.sh for that code.

cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/haam-community/summer_school_vms.git
else
    cd ~/summer_school_vms
    git pull
    cd ~
fi

curl -L https://raw.githubusercontent.com/haam-community/summer_school_vms/refs/heads/main/scripts/get_rfmix_data.sh | bash
#haproh/ancibd dataset update
curl -L https://raw.githubusercontent.com/haam-community/summer_school_vms/refs/heads/main/scripts/get_haproh_data_new.sh | bash
curl -L https://raw.githubusercontent.com/haam-community/summer_school_vms/refs/heads/main/scripts/get_ancibd_data.sh | bash

## Then delete the cloned repository, since we don't need it anymore.
rm -r ~/summer_school_vms
