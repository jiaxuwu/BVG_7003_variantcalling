#!/bin/bash

# make a new folder to save the demultiplexing files
mkdir /Users/jiaxuwu/BVG_7003/varients_calling/NGS

cd /Users/jiaxuwu/BVG_7003/varients_calling/NGS

DATA=/Users/jiaxuwu/BVG_7003/varients_calling/GBS_data/FC20150701_1.fq
BARCODE=/Users/jiaxuwu/BVG_7003/varients_calling/GBS_data/FC20150701_1.txt

exec &> sabre.log

sabre se -f $DATA -b $BARCODE -u unk.fastq
