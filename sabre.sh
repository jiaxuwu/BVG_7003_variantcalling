#!/bin/bash

DATA=/path/to/GBS_data/FC20150701_1.fq
BARCODE=/path/to/GBS_data/FC20150701_1.txt
TOOL=/PATH/TO/sabre

exec &> sabre.log

$TOOL se -f $DATA -b $BARCODE -u unk.fastq
