# BVG_7003_variantcalling

This page is created by Jiaxu Wu

There are some shell scripts for varient calling analysis in BVG_7003 @ Université Laval.

The recoreds and results were saved in `log_result_files` folder.

**Variant calling** is the process by which we identify variants from sequence data.

1. Carry out whole genome or whole exome sequencing to create FASTQ files.

2. Align the sequences to a reference genome, creating BAM or CRAM files.

3. Identify where the aligned reads differ from the reference genome and write to a VCF file.

## Requirement

### Environment

**Python 3.7 or later** --see http://www.python.org

### Softwares

These softwares should be installed before ruuning the scripts.

`sabre` _ver 1.000_ --see https://github.com/najoshi/sabre

`Cutadapt` _ver 4.1_ --see https://cutadapt.readthedocs.io/en/stable/index.html

GNU `parapllel` _ver 20221022_ --see https://www.gnu.org/software/parallel/sphinx.html

`BWA` _ver 0.717_ --see https://github.com/lh3/bwa

`samtools` _ver 1.16.1_ --see https://github.com/samtools/samtools

`bcftools` _ver 1.16_ --see https://github.com/samtools/bcftools

### Reference genome

**Gmax_275_v2.0.fa** is used as the reference genome in this project, please check https://phytozome-next.jgi.doe.gov/info/Gmax_Wm82_a2_v1 for more information.

To download, use this command line 
    
    curl --cookie jgi_session=/api/sessions/1da4539e48a08fee54eb03c1d7750ac6 --output download.20221123.110618.zip -d "{\"ids\":{\"Phytozome-275\":[\"53112af049607a1be0055a33\"]}}" -H "Content-Type: application/json" https://files.jgi.doe.gov/filedownload/
    
To 

## Usage

    ./filename.sh
    
or

    /path/to/filename.sh

## Barcode demultiplexing for FastaQ files



## Remove adapter sequences

## Align uery sequences with the BWA-MEM algorithm.

## Convert SAM to BAM file

## Vairent calling
