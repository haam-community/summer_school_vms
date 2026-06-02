## Pull the summer school setup repo if not already done, then extract the zip of ancIBD files into the mounted volume.
cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/haam-community/summer_school_vms.git & git lfs pull --include "data/ancibd/ancibd_dataset.zip"
else
    cd ~/summer_school_vms
    git lfs pull --include "data/ancibd/ancibd_dataset.zip"
    cd ~
fi

mkdir -p /vol/volume/ancibd
yes y | unzip -d /vol/volume/ancibd/ ~/summer_school_vms/data/ancibd/ancibd_dataset.zip
