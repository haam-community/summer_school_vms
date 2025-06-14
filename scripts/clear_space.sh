#!/usr/bin/env bash

## Clear directories with eager resources, but not results
rm -rf /vol/volume/nf-core-eager/reference
rm -rf /vol/volume/nf-core-eager/data/*fastq.gz
rm -rf /vol/volume/nf-core-eager/analys{i,e}s/
rm -rf /vol/volume/nf-core-eager/work/

## Clear directories with KIN intermediate data
## This gets activated after the genetic kinshp sessions are completed
rm -rf /vol/volume/genetic-kinship/practical/Schroeder_Poland_subset
rm -rf /vol/volume/genetic-kinship/practical/KIN/splitbams/

## For some reason Trash files get collected in the volume. Remove that if it exists too.
rm -rf /vol/volume/.Trash-1000/
