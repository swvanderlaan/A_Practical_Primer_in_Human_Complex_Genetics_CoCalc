# Post-GWAS Analyses {#post-gwas}
<!-- ![](./img/_headers/banner_man_standing_dna.png){width=100%} -->





A critical step in post-GWAS analysis is probably 'mapping SNPs to genes'. It is critical, but it is also the most challenging. _How do you even map SNPs to genes?_ What criteria to use? Should we take into account physical position? Or is it of interest that certain SNPs might influence downstream or upstream gene expression? And what of the fact that most loci discovered in GWAS are _inter_genic? What is the heritability of our trait? Are there any pleiotropic effects?

In the next few sections I deal with a couple of the downstream, post-GWAS analyses. We don't have time to go practically into a few of these steps, but I do believe it is important to provide you with some pointers where to start. 

## Clumping

The Manhattan plot immediately draws your attention to the peaks above the genome-wide significance threshold. **Clumping** is the procedure in which we identify the _independent hits_, those top variants and the variants in linkage disequilibrium (their 'LD buddies') in the same genomic region (_locus_). The basic steps are as follows. First define a threshold above which to identify the top variant, usually this is the genome-wide significance threshold. Next, define the maximum p-value of association a variant may have with the trait of interest. Define the strength of the correlation that is allowed between the top variant and its LD buddies. And lastly define the size of region around the top variant to assess. 

**Clumping** can easily be done in PLINK. And you can too with the dummy GWAS dataset in this additional chapter \@ref(regional_plot_cocalc). You don't have to do it now. You can choose to do it when you have time. 

## Conditional analyses

The visualization of a GWAS is very appealing and draws attention to single peaks, and the most significant variant. And with **clumping** you can identify the independent signals, _i.e._ the top variants and their LD buddies in the locus. We implicitly assume that the top variant captures all the variation in the region by its linkage disequilibrium with an unknown causal variant, in other words it is 'tagging' the (un)measured potential causal variant in the region. Intuitively it is unlikely that a single causal variant is accounting for all the LD between the unknown causal variant and the measured (genotyped or imputed) variants at the locus. So, a naive focus on only the top variant ignores the fact that multiple causal variants exist and thus the variation captured by that single top variant underestimates the total variation that could be explained by that single region (locus).

**Conditional analysis** is a tool to identify the secondary variants associated with the trait of interest. This involves conditioning the association model (`trait ~ Variant X + covariates`) on the primary variant associated in that locus. A more comprehensive and general approach would be to condition on each variant in the whole genome starting with the top variants and stepwise selecting additional variants according to their conditional p-values. This strategy could potentially result in multiple top variants in the same locus. In other words, it could uncover different haplotypes that are causing the same association with the trait of interest. 

This would be straightforward with super computers and full-access to individual level data. Unfortunately we often have neither. 

Don't despair, a method exists that fills this gap. With the program [GCTA](http://cnsgenomics.com/software/gcta/#Overview){target="_blank"} you can execute conditional analyses on GWAS summary statistics - the kind you just produced with the dummy data and with the WTCCC1 dataset - and a proper reference. You can read more on this in [the paper](https://www.nature.com/articles/ng.2213){target="_blank"}.

For now, we will skip this part. I will add a whole chapter on this at some later stage. 

## Statistical finemapping

**Statistical finemapping** is closely related to **conditional analysis**. Where **conditional analysis** identifies secondary signals in a region associated to the trait of interest, **statistical finemapping** answers the question 'which variants are likely causal to the trait?'. In more formal words, through **statistical finemapping** we identify the _95% credible set of causal variants_. 
There are multiple methods and tools developed to get to this answer. I list a few and I encourage you to read up on these. 


### FINEMAP

This tool is very fast and versatile, and was developed by Christian Benner. It will identify the _credible sets_ for each locus and calculates the _posterior probabilities_ for each set. This is the more hands-on version of getting to _credible sets_.

### LocusZoom

You could upload - privately or publicly - your data to [my.locuszoom.org](https://my.locuszoom.org){target="_blank"} and obtain a list of causal variants with posterior probabilities. It uses a [simple procedure](https://statgen.github.io/gwas-credible-sets/method/locuszoom-credible-sets.pdf){target="_blank"} to obtain the _credible sets_ using [these scripts](https://github.com/statgen/gwas-credible-sets/){target="_blank"}. This is the more lazy version of getting a list of likely causal variants.

### SuSIE

An laternate approach to _credible set_ identification is through [SuSIE](https://stephenslab.github.io/susieR/index.html){target="_blank"}. Through SuSIE you can identify _credible sets_ under the assumption of multiple causal variants, whereas **FINEMAP** assumes a single causal variant.

For now, we will skip this part. I will add a whole chapter on this at some later stage. 


## FUMA: FUnctional Mapping and Annotation of GWAS

Researchers from the VUMC in Amsterdam have created an online tool that aids in mapping genes and function to GWAS: *"Functional Mapping and Annotation of Genome-Wide Association Studies"* a.k.a. [FUMA](https://fuma.ctglab.nl){target="_blank"}. This online tool uses a variety of datasets and programs to prioritize genes and map these to associated loci. 

We have covered some aspects of post-GWAS analyses, and a lot are covered by FUMA. Let's try and annotate our WTCCC1 results. The assignment in this chapter \@ref(fuma) will be a bit more _Do It Yourself_.


## Phenome-wide association study

A **phenome-wide association study**, or **PheWAS**, deals with assessing the association of top variants identified in GWAS with other traits. Through a **PheWAS** you'll to get a notion whether on any of the top variants, the independent hits in your GWAS, have pleiotropic effects. In other words, whether your independent hits have effects on other traits too. This will paint a picture as it were about the role the genetic locus you identified plays in life: is it unique to your trait or does it affect other traits as well? What does it mean when your top variant near the gene _FTO_ associates not only to BMI, but also to type 2 diabetes and coronary artery disease? **PheWAS** will not answer that question, but they do help in inventory all the other traits to which your hits are associated.

Again, we'll get a bit hands-on and more _Do It Yourself_ in the chapter that deals with this. Let's jump over to Chapter \@ref(phewas). 

## Colocalization

From all of the above follows another intuitive question. Suppose a signal in your trait also shows association - to some extent - with other traits. Do these two signals than significantly overlap, more so than you would think based on chance? **Colocalization** deals with exactly this question. 

We are not going to deal with **colocalization**, but a nice starting point is [RACER](https://github.com/oliviasabik/RACER){target="_blank"} about which you can read more in chapter \@ref(regional_plot_cocalc). I will add a whole chapter on this at some later stage.  

## Genetic correlation

Because of the underlying biology or because of the way they are measured or calculated, traits can be highly correlated - phenotypically. That is to say, when the levels of HDL are high, LDL is probably low, and so when you draw a correlation plot from some data obtained in a general population you'll see a nice pattern. Biology may also cause traits to be genetically correlated: the same genetic variants influence multiple traits. In other words, if a variant is associated with higher levels of LDL-cholesterol, it may alternatively be associated with lower HDL-cholesterol, etc. Genetic correlation will aid in further understanding the relations between traits biologically: if there is a strong **genetic correlation**, it is may be due to the same biological pathways and so the traits are 'linked' through the same processes (maybe counter-acting processes). 

> Puzzle: what other phenomenom could cause a high but spurious **genetic correlation**?

We are not going to deal with **genetic correlation**. I will add a whole chapter on this at some later stage.  

## Causal inference: Mendelian Randomization

In observational studies we may find a strong association between a certain risk factor or biomarker and a disease. For instance, epidemiological studies show that high circulating cystatin C is associated with risk of cardiovascular disease (CVD), independent of creatinine-based renal function measurements[@vanderlaan2016]. However, residual confounding and reverse causality remain alternative explanations for the strong correlation between cystatin C and CVD, both of which are difficult to tease apart from traditional observational (epidemiological) studies.

**Mendelian Randomization (MR)** harnesses the properties of the genome to enable causal inference of a biomarker. Specifically, the invariant nature of the genome and the random distribution of alleles from parents to offspring at conception mean that genetic information is not influenced by disease status (reverse causality) and should be free from confounding by traditional risk factors[@vanderlaan2016]. So, genetic variation that modulates serum concentrations of cystatin C could serve as an instrumental variable to assess the effect of lifelong elevated concentrations of cystatin C on disease risk, independent of potential confounders[@vanderlaan2016].

Finding the causal genes for complex disease is a primary objective of many researchers, because these genes are putative therapeutic targets. In this course we intend to find out whether Type 2 Diabetes (T2D) causes coronary artery disease and ischemic stroke.

There is an easy, quick-and-dirty way and a harder way. 


### MRBase

The quick-and-dirty way uses [MRBase](http://www.mrbase.org/){target="blank"}. It is based on the `TwoSampleMR` package and uses the `MRInstruments` package to load in all the genetic instruments. The creators of MRBase have curated hundreds of GWAS and molecular QTL studies, and prepared the data for easy use on the website and in the R packages. In Chapter \@ref(mr_mrbase) you can read more about this.


### TwoSampleMR

The hard way means getting your hands dirty and using the `TwoSampleMR` package yourself in `R`. You'll learn all the steps you need to take into account to get to the answer of this question. You'll create the diagnostic graphs and calculate the statistics. Proceed to Chapter \@ref(mr_twosamplemr) to execute a causal analysis using public data.

> In a future version I will aim to include a partial replication of the Cystatin C paper[@vanderlaan2016]

## Polygenic scores

Under the assumption of polygenicity, many variants with small effects contribute to the phenotypic variation in a trait or the risk to disease. Sample size and accurate phenotyping have a major impact on the power of a GWAS. It is estimated that 70% of variants that reach 10<sup>-6</sup> in an initial discovery GWAS will reach genome-wide significance with increasing sample sizes. The individual variants that do reach genome-wide significance the first or second time around do not explain _all_ the phenotypic variation or residual disease risk.

To capture the polygenicity of a trait beyond individual genome-wide significant hits, we can calculate a polygenic score (PGS). There are several methods to calculate PGS, but essentially it comes down to multiplying the effect size at a given variant with the number of effect alleles a given individual carries. 
Depending on the method you can use the 'hard-coded' genotyped data, or the imputed data. In case of the latter the effect sizes are multiplied by the genotype probabilities or dosages, this ensures that the PGS takes into account the uncertainty intrinsic to imputed data. 

Let's consider the most intuitive PGS-method which is based on p-value thresholding, which was nicely applied in this classic [paper](https://doi.org/10.1038/nature08185){target="_blank"}. This method selects variants based on their p-value and than calculates the PGS. This can be done using increasingly liberal significance thresholds (p<sub>T</sub>), for instance starting with all variants with p < 10<sup>-8</sup>, next p < 10<sup>-7</sup>, p < 10<sup>-6</sup>, p < 10<sup>-5</sup>, p < 10<sup>-4</sup>, p < 10<sup>-3</sup>, p < 0.05, p < 0.1, p < 0.2, p < 0.3, p < 0.4, p < 0.5. Under the assumption of polygenicity we expect an increasingly stronger correlation (r<sup>2</sup>) of the PGS at a certain p<sub>T</sub> with the trait of interest. Another application of this method is provided by Van Setten[@vansetten2015].

Lastly, there is a great explanatory [website](http://polygenicscores.org/explained/){target="_blank"} on how to calculate PGS, and it also shows one application of PGS (although much debate ensues about this particular application!).


## What comes next

You come to the end of this practical primer. What is left are a summary (not written yet) of what you've learned and should take home. And some musings in the Epilogue (\@ref(epilogue) on this book and what the future holds.

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/banner_man_standing_dna.png" alt="post-GWAS">' + title.innerHTML
</script>
