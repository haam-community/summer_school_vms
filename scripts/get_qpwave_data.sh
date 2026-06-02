## Pull the summer school setup repo if not already done, then extract the zip of imputation files into the mounted volume.
cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/haam-community/summer_school_vms.git & git lfs pull --include "data/admixtools2/AADR.zip"
else
    cd ~/summer_school_vms
    git lfs pull --include "data/admixtools2/AADR.zip"
    cd ~
fi

yes y | unzip -d /vol/volume/qpwave-qpadm-qpgraph/ ~/summer_school_vms/data/admixtools2/AADR.zip
