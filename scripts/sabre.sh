#!/bin/bash

# make a new folder to save the demultiplexing files
mkdir /path/to/NGS

cd /path/to/NGS

DATA=/path/to/GBS_data/FC20150701_1.fq
BARCODE=/path/to/GBS_data/FC20150701_1.txt

exec &> sabre.log

# Use se function for single-end barcode de-multiplexing
sabre se -f $DATA -b $BARCODE -u unk.fastq
