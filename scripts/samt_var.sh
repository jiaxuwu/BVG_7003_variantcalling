#!/bin/bash


DATA=/path/to/NGS/bamlist
REF=/path/to/Gmax_275_v2.0.fa
OUT=variantcalling
CPU=4

cd /path/to/NGS

# Create a folder to save the .bcf and .vcf files
mkdir result1

cd result1

exec &> samt_var.log

bcftools mpileup -f $REF -b $DATA > variants.bcf

	if [ $? -ne 0 ]
                        then
                                printf "There is a problem at the samtools_mpileup step"
                                exit 1
                fi


bcftools call -mv variants.bcf > variants.vcf

	if [ $? -ne 0 ]
                        then
                                printf "There is a problem at the bcf2vcf step"
                                exit 1
                fi
