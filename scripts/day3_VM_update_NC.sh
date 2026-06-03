#!/usr/bin/env bash

## NOTE: In day 3, the git LFS budget had been spent,
##    so I uploaded all the datasets to nextcloud and had students download them through that.
##    See script day3_VM_update_NC.sh for that code.

cd ~

## First remove the existing outdated datasets.
rm -r /vol/volume/ancibd/*
rm -r /vol/volume/haproh/*
rm -r /vol/volume/rfmix-ibd/*

## ancibd dataset
curl -L https://share.eva.mpg.de/index.php/s/QwtpK3teFoyfjyx -o ~/ancibd_dataset.zip && unzip -d /vol/volume/ancibd/ ~/ancibd_dataset.zip && rm ~/ancibd_dataset.zip

## haproh dataset
curl -L https://share.eva.mpg.de/index.php/s/rDL25zw9ixbGpWA -o ~/haproh_dataset.zip && unzip -d /vol/volume/haproh/ ~/haproh_dataset.zip && rm ~/haproh_dataset.zip

## rfmix dataset
curl -L https://share.eva.mpg.de/index.php/s/fWjkJfdGtjC4QbJ -o ~/rfmix_dataset.zip && unzip -d /vol/volume/rfmix-ibd/ ~/rfmix_dataset.zip && rm ~/rfmix_dataset.zip
