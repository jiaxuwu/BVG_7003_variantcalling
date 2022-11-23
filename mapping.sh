#!/bin/bash

DATA=/Users/jiaxuwu/BVG_7003/varients_calling/NGS

REF=/Users/jiaxuwu/BVG_7003/varients_calling/refgenome/Gmax_275_v2.0.fa

CPU=3
THR=2
cd $DATA
exec &> bwa.log


parallel -j $CPU bwa mem -t $THR $REF {}.fastq ">" {}.sam ::: $(ls -1 *.fastq | sed 's/.fastq//')
		if [ $? -ne 0 ]
			then 
				printf There is a problem in the alignment step
				exit 1
		fi
