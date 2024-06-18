#!/usr/bin/env bash

## Clear directories with raw ENA data
rm -r /vol/volume/ena-data/

## Clear directories with eager resources, but not results
rm -r /vol/volume/nf-core-eager/reference
rm -r /vol/volume/nf-core-eager/data

## Clear directories with KIN intermediate data
rm -r /vol/volume/genetic-kinship/practical/KIN/data/
rm -r /vol/volume/genetic-kinship/practical/KIN/splitbams/
