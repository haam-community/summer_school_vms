## Pull the summer school setup repo if not already done, then extract the zip of imputation files into the mounted volume.
cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    git clone https://github.com/haam-community/summer_school_vms.git & git lfs pull --include "data/unsupervised_analyses/*.tar.gz" & wait
else
    cd ~/summer_school_vms
    git lfs pull --include "data/unsupervised_analyses/*.tar.gz" & wait
    cd ~
fi

mkdir -p /vol/volume/unsupervised_analyses
yes y | tar -xzf ~/summer_school_vms/data/unsupervised_analyses/Data_ADMIX.tar.gz -C /vol/volume/unsupervised_analyses/
yes y | tar -xzf ~/summer_school_vms/data/unsupervised_analyses/Data_MDS_PCA.tar.gz -C /vol/volume/unsupervised_analyses/
