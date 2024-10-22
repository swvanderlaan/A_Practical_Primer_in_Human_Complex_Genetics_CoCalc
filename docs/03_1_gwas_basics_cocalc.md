# Steps in a Genome-Wide Association Study {#gwas-basics-cocalc}
<!-- ![](./img/_headers/woman_working_on_code.png){width=100%} -->






Now that you understand a bit of the navigation in Unix-systems, you're ready to start this practical primer. We will make use of a dummy dataset containing cases and controls. We will explain and execute the following steps:

1. convert raw data to a more memory-efficient format
2. apply extensive quality control on samples and SNPs
3. assess the ancestral background of your study population
4. perform association testing
5. visualize association results

## Introduction
The format in which genotype data are returned to investigators varies among genome-wide SNP platforms and genotyping centers. Usually genotypes have been called by a genotyping center and returned in the standard `PED` and `MAP` file formats designed for `PLINK`.

A `PED` file is a white space (space or tab)-delimited file in which each line represents one individual and the first six columns are mandatory and in the following order:

- 'Family ID', 
- 'Individual ID', 
- 'Paternal ID', 
- 'Maternal ID', 
- 'Sex (1=male, 2=female, 0=missing)', and 
- 'Phenotype (1=unaffected, 2=affected, 0=missing)'. 

The subsequent columns denote genotypes that can be any character (e.g., 1, 2, 3, 4 or A, C, G, T). Zero denotes a missing genotype. Each SNP must have two alleles (i.e., both alleles are either present or absent). 
The order of SNPs in the PED file is given in the MAP file, in which each line denotes a single marker and the four white-space–separated columns are chromosome (1–22, X, Y or 0 for unplaced), marker name (typically an rs number), genetic distance in Morgans (this can be fixed to 0) and base-pair position (bp units).

Let's start by using `PLINK` to converting the datasets to a lighter, binary form (a `.bed`-file). This file saves data in a more memory- and time-efficient manner (in a 'binary'-format) to facilitate the analysis of large-scale data sets [@purcell2007]. The marker-information is stored in the `.bim`-file and the family information in the `.fam`-file. `PLINK` creates a `.log` file (named `raw-GWA-data.log`) that details (among other information) the implemented commands, the number of cases and controls in the input files, any excluded data and the genotyping rate in the remaining data. This file is very useful for checking whether the software is successfully completing commands.

### Setting the stage

Make sure you are in the right directory. _Do you remember how to get there?_

In the Terminal window you type the following:

```
cd $HOME
```

You know that you're 'home' when you type `pwd` and see path with a lot of numbers and letters like this `/projects/e66af6fa-60ee-4448-972f-daaf235ca9da` - yours will be a different sequence of numbers and letters. 

Start by creating a project directory. 

```
mkdir -v dummy_project
```

As I mentioned, all the data is stored in the `~/data/shared` directory. So, if you do the following:

```
ls ~/data/shared
```

You will see this:

```
dummy_project  gwas  rawdata  readme.txt  readme.wtccc1.txt  ref_1kg_phase1_all  scripts  support  wtccc1
```

(in blue the directories, in black the files)

- The `dummy_project` in `~/data/shared` contains all the results from this practical primer. You're not going to use that, if all is well, because you're going to do it yourself in the following Chapters. 
- The `gwas` directory contains the data from the dummy GWAS we will perform. 
- The `rawdata` directory contains the dummy data we will use. 
- The `ref_1kg_phase1_all` directory contains the reference data from the 1000 Genomes Project. 
- The `wtccc1` directory contains the WTCCC1 data. 
- The `support` directory contains some additional files that are used in the practical primer. 
- The `scripts` directory contains the scripts we will use. 
- The `readme.txt` and `readme.wtccc1.txt` files contain some additional information.

## Converting the data

Let's convert the `.ped`/`.map` files to the binary-format.

```
plink --file ~/data/shared/rawdata/raw-GWA-data --make-bed --out dummy_project/rawdata
```

Let's review the `.log`-file for a bit. It should look something like this:

```
PLINK v1.90b7.2 64-bit (11 Dec 2023)           www.cog-genomics.org/plink/1.9/
(C) 2005-2023 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to dummy_project/rawdata.log.
Options in effect:
  --file rawdata/raw-GWA-data
  --make-bed
  --out dummy_project/rawdata

16384 MB RAM detected; reserving 8192 MB for main workspace.
.ped scan complete (for binary autoconversion).
Performing single-pass .bed write (317503 variants, 2000 people).
--file: dummy_project/rawdata-temporary.bed +
dummy_project/rawdata-temporary.bim + dummy_project/rawdata-temporary.fam
written.
317503 variants loaded from .bim file.
2000 people (997 males, 1003 females) loaded from .fam.
2000 phenotype values loaded from .fam.
Using 1 thread (no multithreaded calculations invoked).
Before main variant filters, 2000 founders and 0 nonfounders present.
Calculating allele frequencies... done.
Warning: 11440 het. haploid genotypes present (see dummy_project/rawdata.hh );
many commands treat these as missing.
Total genotyping rate is 0.985682.
317503 variants and 2000 people pass filters and QC.
Among remaining phenotypes, 1023 are cases and 977 are controls.
--make-bed to dummy_project/rawdata.bed + dummy_project/rawdata.bim +
dummy_project/rawdata.fam ... done.
```

So, there are 317,503 variants included for 2,000 people, 997 males and 1,003 females. All of these individuals are ['founders'](https://www.cog-genomics.org/plink/1.9/filter#nonfounders){target="_blank"}. There are 1,023 cases and 977 controls. The genotyping rate is about 98.6% which is pretty good. Lastly, there are 11,440 heterozygous haploid genotypes present.

> Question: Can you think off what the '11,440 heterozygous haploid genotypes present' represent? 


## Quality control

We are ready for some quality control and quality assurance, heavily inspired by Anderson _et al._ [@anderson2010] and Laurie _et al._ [@laurie2010]. In general, we should check out a couple of things regarding the data quality on two levels:

1) samples
2) variants

So, we will investigate the following:

- Are the *sexes* based on genetic data matching the ones given by the phenotype file?
- Identify individuals that are outliers in terms of missing data (_call rate_) or heterozygosity rates. This could indicate a genotyping error or sample swap.
- Identify duplicated or related individuals.
- Identify individuals with divergent ancestry.
- What are the allele frequencies?
- What is the per-SNP call rate?
- In the case of a case-control study (which is the case here), we need to check differential missingness between cases and controls. 

> Question: Can you think of other scenarios in which you may want to extend the check on differential missingness beyond a check between cases and controls?


## Let's get our hands dirty

All clear? Let's start the work. On to step 1 of the QC for GWAS: filter samples of poor quality in Chapter \@ref(gwas-basics-sample-qc-cocalc).

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/woman_working_on_code.png" alt="GWAS basics">' + title.innerHTML
</script>
