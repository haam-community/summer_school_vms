## Pull the summer school setup repo if not already done, then extract the zip of imputation files into the mounted volume.
cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/haam-community/summer_school_vms.git & git lfs pull --include "data/imputation/imputation.zip"
else
    cd ~/summer_school_vms 
    git lfs pull --include "data/imputation/imputation.zip"
    cd ~
fi

unzip -d /vol/volume/imputation/ ~/summer_school_vms/data/imputation/imputation.zip
