#!/bin/bash
cd /path/to/NGS
ADAP=AGATCGGAA

exec &> cutadapt.log

parallel -j 4 cutadapt -a $ADAP -m 50 -o {}.fastq {}.fq ::: $(ls -1 *.fq | sed 's/.fq//')
	if [ $? -ne 0 ]
		then
			printf There is error in the cutadapt
			exit 1
	fi
