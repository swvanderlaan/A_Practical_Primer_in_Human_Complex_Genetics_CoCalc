# The Welcome Trust Case-Control Consortium {#wtccc1-intro}
<!-- ![](./img/_headers/interactive_plot.png){width=100%} -->





Now that you know your way around `PLINK`, `bash` and `r` and have done some basic quality control and association testing, you are ready for the real thing. We have prepared a real dataset: the first release of the [*Welcome Trust Case-Control Consortium (WTCCC)*](https://www.wtccc.org.uk/ccc1/overview.html){target="_blank"} on coronary artery disease (CAD) and a control dataset used for that project. 

## Genotyping

The WTCCC1 data were genotyped using a chip from [Affymetrix](https://www.thermofisher.com/us/en/home/life-science/microarray-analysis/affymetrix.html?category=34000&categoryIdClicked=34000&rootCategoryId=34000&navMode=34000&aId=productsNav){target="_blank"}, nowadays  part of ThermoFisher. As a brand Affymetrix still exists, but the chips aren't made anymore. Unfortunately, most links to the old generation Affymetrix chips are borken, but you can still find some information about the 500K chip that was used for [WTCCC1](https://tools.thermofisher.com/content/sfs/brochures/whole_genome_assoc_500k_jsmith.pdf){target="_blank"}. It's good practice to read up a bit on what chip was used, and what [support materials are available](https://www.thermofisher.com/us/en/home/life-science/microarray-analysis/microarray-data-analysis.html){target="_blank"}. 

## The data

Before quality control the original data included: 

- CAD cohort, n ± 2,000
- Healthy controls, from the UK 1958 birth control cohort (UKB58), n ± 1,500 (we won't use this)
- Healthy controls, from the UK National Blood Service (NBS), n ± 1,500.

## Assignment

Your assignment in the next chapter is to do the following:

1. Explore the individual datasets by calculating some statistics and visualising these.
2. Merge the datasets in the folder `wtccc1`.
3. Calculate PCs using `--pca` in `PLINK`.
4. Perform an association test using available covariates. 
5. Visualize the results.
6. Identify independent SNPs.
7. Make regional association plots.


## There you go

As I wrote, you are ready for the real stuff in Chapter \@ref(wtccc1-qc-cocalc). 

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/interactive_plot.png" alt="WTCCC1 introduction">' + title.innerHTML
</script>
