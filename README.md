# BVG_7003_variantcalling

This page is created by Jiaxu Wu

There are some shell scripts for varient calling analysis in BVG_7003 @ Université Laval.

All the scripts used in this project were collected in `script` folder. The recoreds and results were saved in the `log_result_files` folder.
We also attached suquencing test files in the `GBS_data` folder, which includes `FC20150701_1.fq` and `FC20150701_1.txt`.

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

After running this script, we could find a new created `NGS` folder which includs 48 .fq files and 1 unk.fastq file. The `sabre.log` was also created, which you can find in the `log_result_files` folder.

## Remove adapter sequences

In this setp, the script of `cutad_for.sh` or `cutad_parallel.sh` will be used. 

Before running the script, make sure cutadapt and GNU parallel are functioning normally. 

For `cutadapt`

    conda activate cutadaptenv # activating the environment to run cutadapt
    cutadapt # run cutadapt to check it is working 
    
For `parallel`

    parallel # run parallel to check it is working

Then, running `cutad_for.sh` or `cutad_parallel.sh`.

The sequence of the 3' adapter is given in the script is `AGATCGGAA`. With the -a option, we need to replace `AGATCGGAA` with the correct adapter sequence. Reads are read from the input file input.fastq and are written to the output file output.fastq

After running the scripts, we could find 48 .fastq files in the `NGS` folder, and the `cutadapt.log` was also created, which you can find in the `log_result_files` folder.

## Align sequences with the BWA-MEM algorithm

In this step, the script of `mapping.sh` will be used.

before running the script, make sure BWA and GNU parallel are functioning normally.

For `BWA`

    bwa # run BWA to check it is working 
    
Then running `mapping.sh`.

Align 70bp-1Mbp query sequences with the BWA-MEM algorithm, which is the latest, and generally recommended for high-quality queries as it is faster and more accurate. **Gmax_275_v2.0.fa** is the reference genome.

After running the scripts, we could find  in the 49 .sam files (48 .fq.sam + 1 unk.sam) in the `NGS` folder, and the `bwa.log` was also created, which you can find in the `log_result_files` folder.

## Convert SAM to BAM file

In this step, the script of `sam2bam.sh` will be used.

before running the script, make sure Samtools and GNU parallel are functioning normally.

For `Samtools`

    samtools # run Samtools to check it is working 
    
Then running `sam2bam`.

The script follows these process: 1. convert SAM format to BAM format; 2. sort BAM files; 3. indexing of BAM files; 4. create a list of BAM files with path.

After running this script, you could find 49 raw BAM files, 49 sorted BAM files, 49 indxed BAM files, 1 bamlist which recores the path of BAM files in the `NGS` folder, and the `convert.log` was also created. You can find the `bamlist` file and `convert.log` in the `log_result_files` folder.

## Vairent calling

In this step, the script of `samt_var.sh` will be used.

before running the script, make sure BCFtools and GNU parallel are functioning normally.

For `BCFtools`

    bcftools # run BCFtools to check it is working 
    
Then running `samt_var.sh`.

Generate VCF and BCF containing genotype likelihoods for multiple BAM files. This is based on the BCFtools mpileup command producing genotype likelihoods in VCF or BCF format. **Gmax_275_v2.0.fa** is the reference genome.

After running this script, we could find a new created `result1` folder which includes 1 .bcf file (`varients.bcf`), 1 .vcf file (varients.vcf`), and 1 .log file (`samt_var.log`) in the `NGS` folder. You can find the `varients.vcf` file and `samt_var.log` in the `log_result_files` folder.
