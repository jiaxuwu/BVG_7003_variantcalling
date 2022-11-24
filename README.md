# BVG_7003_variantcalling

This page is created by Jiaxu Wu

There are some shell scripts for varient calling analysis in BVG_7003 @ Université Laval.

All the scripts used in this project were collected in `script` folder. The recoreds and results were saved in the `log_result_files` folder.

**Variant calling** is the process by which we identify variants from sequence data.

1. Carry out whole genome or whole exome sequencing to create FASTQ files.

2. Align the sequences to a reference genome, creating BAM or CRAM files.

3. Identify where the aligned reads differ from the reference genome and write to a VCF file.

## Requirement

### Environment

**Python 3.7 or later** --see http://www.python.org

### Software

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
    
We also attached suquencing test files in the `GBS_data` folder, which includes `FC20150701_1.fq` and `FC20150701_1.txt`.

## Usage

    ./filename.sh
    
or

    /path/to/filename.sh

## Barcode demultiplexing for FastaQ files

In this setp, the script of `sabre.sh` will be used. 

Before use the script, please run sabre to make sure it is working.

    sabre
    
Then, running the `sabre.sh`.

This scripts takes an input fastq file (FC20150701_1.fq) and an input barcode data (FC20150701_1.txt) file and outputs the reads demultiplexed into separate files using the file names from the data file. 

After running this script, we could find a new created `NGS` folder which includs 48 .fq files and 1 unk.fastq file. The `sabre.log` were also created, which you can find in the `log_result_files` folder.

## Remove adapter sequences

In this setp, the script of `cutad_for.sh` or `cutad_parallel.sh` will be used. 

Before using the script, make sure cutadapt and parallel are functioning normally. 

For `cutadapt`

    conda activate cutadaptenv # the environment for activating cutadapt
    cutadapt # run cutadapt to check it is working 
    
For `parallel`

    parallel #run parallel to check it is working


## Align uery sequences with the BWA-MEM algorithm.

## Convert SAM to BAM file

## Vairent calling
