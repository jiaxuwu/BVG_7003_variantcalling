#!/bin/zsh

cd /Users/jiaxuwu/BVG_7003/varients_calling/NGS

# 3' adapter
ADAP=AGATCGGAA

exec &> cutadapt.log

for i in *.fq;
	do
		cutadapt -a $ADAP -o $i.fastq $i
	done	

