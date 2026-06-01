## Pull the summer school setup repo if not already done, then extract the zip of imputation files into the mounted volume.
cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    git clone https://github.com/haam-community/summer_school_vms.git & git lfs pull --include "data/admixtools2/AADR.zip"
else
    cd ~/summer_school_vms &&
    git lfs pull --include "data/admixtools2/AADR.zip"
    cd ~
fi

unzip -d /vol/volume/admixtools2/ ~/summer_school_vms/data/admixtools2/AADR.zip
