#!/bin/bash

cd /path/to/NGS

# 3' adapter
ADAP=AGATCGGAA

exec &> cutadapt.log

for i in *.fq;
	do
		cutadapt -a $ADAP -o $i.fastq $i
	done	

