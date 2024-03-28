# Answers to the questions {#answers}
<!-- ![](./img/_headers/banner_man_standing_dna.png){width=100%} -->





Throughout the book you encountered questions related to some steps and output that you generated. Here you can review the answers for each of these questions - of course, for some different answers are possible.

> [ANSWERS NEED TO BE WORKED OUT]

## Chapter 3.1: GWAS Basics
> Question: Can you think off what the '11,440 heterozygous haploid genotypes present' represent? 

> Question: Can you think of other scenarios in which you may want to extend the check on differential missingness beyond a check between cases and controls?
 * For instance 'genotyping platform', or 'hospital of inclusion', if you think this might influence the genotyping experiment technically.

## Chapter 3.4: GWAS Basics - Association testing

> Question: Load the data using R. [Hint: use and adapt the examples from the previous chapters.]

```
library("data.table")

COURSE_loc = "~/Desktop/practical" # getwd()

gwas_HWE <- data.table::fread(paste0(COURSE_loc, "/dummy_project/gwa.hwe"))
gwas_FRQ <- data.table::fread(paste0(COURSE_loc, "/dummy_project/gwa.frq"))
gwas_IMISS <- data.table::fread(paste0(COURSE_loc, "/dummy_project/gwa.imiss"))
gwas_LMISS <- data.table::fread(paste0(COURSE_loc, "/dummy_project/gwa.lmiss"))
```

> Question: Plot the per-stratum HWE p-values using R. [Hint: use and adapt the examples from the previous chapters.]

```
library("ggpubr")

gwas_HWE$logP <- -log10(gwas_HWE$P)

ggpubr::gghistogram(gwas_HWE, x = "logP",
                    add = "mean",
                    add.params = list(color = "#595A5C", linetype = "dashed", size = 1),
                    rug = TRUE,
                    # color = "#1290D9", fill = "#1290D9",
                    color = "TEST", fill = "TEST",
                    palette = "lancet",
                    facet.by = "TEST",
                    bins = 50,
                    xlab = "HWE -log10(P)") +
  ggplot2::geom_vline(xintercept = 5, linetype = "dashed",
                      color = "#E55738", size = 1)
ggplot2::ggsave(paste0(COURSE_loc, "/dummy_project/gwas-hwe.png"),
       plot = last_plot())
```

> Question: Plot the allele frequencies using R. [Hint: use and adapt the examples from the previous chapters.]

```
ggpubr::gghistogram(gwas_FRQ, x = "MAF",
                    add = "mean", add.params = list(color = "#595A5C", linetype = "dashed", size = 1),
                    rug = TRUE,
                    color = "#1290D9", fill = "#1290D9",
                    xlab = "minor allele frequency") +
  ggplot2::geom_vline(xintercept = 0.05, linetype = "dashed",
                      color = "#E55738", size = 1)
ggplot2::ggsave(paste0(COURSE_loc, "/dummy_project/gwas-freq.png"),
       plot = last_plot())
```


> Question: Plot the per-sample call rates using R. [Hint: use and adapt the examples from the previous chapters.]

```
gwas_IMISS$callrate <- 1 - gwas_IMISS$F_MISS

ggpubr::gghistogram(gwas_IMISS, x = "callrate",
                    add = "mean", add.params = list(color = "#595A5C", linetype = "dashed", size = 1),
                    rug = TRUE, bins = 50,
                    color = "#1290D9", fill = "#1290D9",
                    xlab = "per sample call rate") +
  ggplot2::geom_vline(xintercept = 0.95, linetype = "dashed",
                      color = "#E55738", size = 1)
ggplot2::ggsave(paste0(COURSE_loc, "/dummy_project/gwas-sample-call-rate.png"),
       plot = last_plot())
```

> Question: Plot the per-SNP call rates using R. [Hint: use and adapt the examples from the previous chapters.]

```
gwas_LMISS$callrate <- 1 - gwas_LMISS$F_MISS

ggpubr::gghistogram(gwas_LMISS, x = "callrate",
                    add = "mean", add.params = list(color = "#595A5C", linetype = "dashed", size = 1),
                    rug = TRUE, bins = 50,
                    color = "#1290D9", fill = "#1290D9",
                    xlab = "per SNP call rate") +
  ggplot2::geom_vline(xintercept = 0.95, linetype = "dashed",
                      color = "#E55738", size = 1)
ggplot2::ggsave(paste0(COURSE_loc, "/dummy_project/gwas-snp-call-rate.png"),
       plot = last_plot())
```

> Question: Do you know which model, _i.e._ `TEST` is most commonly used and reported? And why is that, do think?

> Question: How come there are more lines in this file than there are variants?
 
> Question: Can you write down the mathematical relation between _beta_ and _OR_?

## Chapter 3.5: GWAS visualization

> Question: Why do the number of variants per chrosome (approximately) correlate with the chromosome number?

> Question: Where are the data for chromosome X, Y and MT?

> Question: What do the grey spots on the density plot indicate?


## Chapter 5.4: FUMA

> Question: can you figure out the sample size of the WTCCC1 data you used?

> Questions
> 
> 1. How many lead SNPs did we find?
> 2. What do the results of MAGMA (the gene-based test) look like and how many genes pass the threshold of multiple testing correction?
> 3. How many loci were mapped?
> 4. How many genes were physically located and how many were mapped to these loci?
> 5. Do you think all loci are 'correct', _i.e._ do you 'believe' all the signals looking at the mapping results? Why?
> 6. For what tissues are the signals enriched?
> 7. Are there any chromatin interactions discovered?

> Questions
> 
> 1. What genes show the lowest expression across tissues?
> 2. And what genes the highest?
> 3. For what pathways are the signals enriched?
> 4. What molecular functions are mapped to the signals?



<!-- ```{js, echo = FALSE} -->
<!-- title=document.getElementById('header'); -->
<!-- title.innerHTML = '<img src="img/_headers/banner_man_standing_dna.png" alt="Answers to questions">' + title.innerHTML -->
<!-- ``` -->