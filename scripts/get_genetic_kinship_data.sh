#!/usr/bin/env bash

mkdir -p /vol/volume/genetic-kinship/data/
cd /vol/volume/genetic-kinship/data/

## Symlink the Schroeder BAMs here.
ln -s /vol/volume/nf-core-eager/data/*bam .
