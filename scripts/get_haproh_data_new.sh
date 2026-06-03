## Pull the summer school setup repo if not already done, then extract the zip of haproh files into the mounted volume.
cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/haam-community/summer_school_vms.git
fi

cd ~/summer_school_vms
git lfs pull --include "data/haproh/haproh_dataset.zip" & wait
cd ~

mkdir -p /vol/volume/haproh
yes y | unzip -d /vol/volume/haproh/ ~/summer_school_vms/data/haproh/haproh_dataset.zip
