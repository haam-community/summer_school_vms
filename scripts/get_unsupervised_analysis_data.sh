## Pull the summer school setup repo if not already done, then extract the tars of unsupervised_analysis files into the mounted volume.
cd ~
if [[ ! -d ~/summer_school_vms ]]; then
    GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/haam-community/summer_school_vms.git
fi

cd ~/summer_school_vms
git lfs pull --include "data/unsupervised_analyses/*.tar.gz" & wait
cd ~

mkdir -p /vol/volume/unsupervised_analyses
tar -xzf ~/summer_school_vms/data/unsupervised_analyses/Data_ADMIX.tar.gz -C /vol/volume/unsupervised_analyses/
tar -xzf ~/summer_school_vms/data/unsupervised_analyses/Data_MDS_PCA.tar.gz -C /vol/volume/unsupervised_analyses/
