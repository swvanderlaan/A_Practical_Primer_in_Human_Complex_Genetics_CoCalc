# Sample QC {#gwas-basics-sample-qc-cocalc}
<!-- ![](./img/_gwas_dummy/gwas_sample_qc.png){width=70%} -->






Let's start with the per-sample quality control. The goal here is to identify all the samples that for some reason (mentioned in the previous section) should be excluded. 

## Sex
We need to identify of individuals with discordant sex information comparing phenotypic and genotypic data. Let's calculate the mean homozygosity rate across X-chromosome markers for each individual in the study.

```
plink --bfile dummy_project/rawdata --check-sex --out dummy_project/rawdata
```

This produces a file with the following columns:

- _FID_	Family ID
- _IID_	Within-family ID
- _PEDSEX_	Sex code in input file
- _SNPSEX_	Imputed sex code (1 = male, 2 = female, 0 = unknown)
- _STATUS_	'OK' if PEDSEX and SNPSEX match and are nonzero, 'PROBLEM' otherwise
- _F_	Inbreeding coefficient, considering only X chromosome. Not present with 'y-only'.
- _YCOUNT_	Number of nonmissing genotype calls on Y chromosome. Requires 'ycount'/'y-only'.


We need to get a list of individuals with discordant sex data.

```
cat dummy_project/rawdata.sexcheck | awk '$5 =="STATUS" || $5 =="PROBLEM"'  > dummy_project/rawdata.sexprobs.txt
```

Let's have a look at the results in `R` in the Terminal.

```
cat dummy_project/rawdata.sexprobs.txt
```


```r
sexissues <- data.table::fread("dummy_project/rawdata.sexprobs.txt")
```




```{=html}
<div class="tabwid"><style>.cl-9b96a4ea{}.cl-9b902bd8{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-9b926c2c{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9b926c36{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9b927e92{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927e9c{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927e9d{width:0.932in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927ea6{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927ea7{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927eb0{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927eb1{width:0.932in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927eba{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927ebb{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927ec4{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927ec5{width:0.932in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b927ece{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-9b96a4ea'>

```

<caption style="display:table-caption;">(\#tab:sexissues)<span>Sex issues.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-9b927e92"><p class="cl-9b926c2c"><span class="cl-9b902bd8">FID</span></p></th><th class="cl-9b927e92"><p class="cl-9b926c2c"><span class="cl-9b902bd8">IID</span></p></th><th class="cl-9b927e9c"><p class="cl-9b926c2c"><span class="cl-9b902bd8">PEDSEX</span></p></th><th class="cl-9b927e9c"><p class="cl-9b926c2c"><span class="cl-9b902bd8">SNPSEX</span></p></th><th class="cl-9b927e9d"><p class="cl-9b926c36"><span class="cl-9b902bd8">STATUS</span></p></th><th class="cl-9b927ea6"><p class="cl-9b926c2c"><span class="cl-9b902bd8">F</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-9b927ea7"><p class="cl-9b926c2c"><span class="cl-9b902bd8">772</span></p></td><td class="cl-9b927ea7"><p class="cl-9b926c2c"><span class="cl-9b902bd8">772</span></p></td><td class="cl-9b927eb0"><p class="cl-9b926c2c"><span class="cl-9b902bd8">2</span></p></td><td class="cl-9b927eb0"><p class="cl-9b926c2c"><span class="cl-9b902bd8">0</span></p></td><td class="cl-9b927eb1"><p class="cl-9b926c36"><span class="cl-9b902bd8">PROBLEM</span></p></td><td class="cl-9b927eba"><p class="cl-9b926c2c"><span class="cl-9b902bd8">0.3084</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9b927ea7"><p class="cl-9b926c2c"><span class="cl-9b902bd8">853</span></p></td><td class="cl-9b927ea7"><p class="cl-9b926c2c"><span class="cl-9b902bd8">853</span></p></td><td class="cl-9b927eb0"><p class="cl-9b926c2c"><span class="cl-9b902bd8">2</span></p></td><td class="cl-9b927eb0"><p class="cl-9b926c2c"><span class="cl-9b902bd8">0</span></p></td><td class="cl-9b927eb1"><p class="cl-9b926c36"><span class="cl-9b902bd8">PROBLEM</span></p></td><td class="cl-9b927eba"><p class="cl-9b926c2c"><span class="cl-9b902bd8">0.3666</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9b927ebb"><p class="cl-9b926c2c"><span class="cl-9b902bd8">1,920</span></p></td><td class="cl-9b927ebb"><p class="cl-9b926c2c"><span class="cl-9b902bd8">1,920</span></p></td><td class="cl-9b927ec4"><p class="cl-9b926c2c"><span class="cl-9b902bd8">2</span></p></td><td class="cl-9b927ec4"><p class="cl-9b926c2c"><span class="cl-9b902bd8">0</span></p></td><td class="cl-9b927ec5"><p class="cl-9b926c36"><span class="cl-9b902bd8">PROBLEM</span></p></td><td class="cl-9b927ece"><p class="cl-9b926c2c"><span class="cl-9b902bd8">0.4066</span></p></td></tr></tbody></table></div>
```


When the homozygosity rate (_F_) is more than 0.2, but less than 0.8, the genotype data are inconclusive regarding the sex of an individual and these are marked in column _SNPSEX_ with a 0, and the column _STATUS_ "PROBLEM".

Report the IDs of individuals with discordant sex information (Table \@ref(tab:sexissues)) to those who conducted sex phenotyping. In situations in which discrepancy cannot be resolved, add the family ID (FID) and individual ID (IID) of the samples to a file named `fail-sexcheck-qc.txt` (one individual per line, tab delimited).

```
grep "PROBLEM" dummy_project/rawdata.sexcheck | awk '{ print $1, $2}'  > dummy_project/fail-sexcheck-qc.txt
```

## Sample call rates
Let's get an overview of the missing data per sample and per SNP.

```
plink --bfile dummy_project/rawdata --missing --out dummy_project/rawdata
```

This produces two files, `rawdata/rawdata.imiss` and `rawdata/rawdata.lmiss`. In the `.imiss`-file the _N_MISS_ column denotes the number of missing SNPs, and the _F_MISS_ column denotes the proportion of missing SNPs per individual.


```r
raw_IMISS <- data.table::fread("dummy_project/rawdata.imiss")
raw_IMISS$callrate <- 1 - raw_IMISS$F_MISS
```



Now you can plot these missing genotypes per samples, the 'sample call rate'. 


```r
library("ggpubr")

ggpubr::gghistogram(raw_IMISS, x = "callrate",
                    add = "mean", add.params = list(color = "#595A5C", linetype = "dashed", size = 1),
                    rug = TRUE, bins = 50,
                    color = "#1290D9", fill = "#1290D9",
                    xlab = "per sample call rate") +
  ggplot2::geom_vline(xintercept = 0.95, linetype = "dashed",
                color = "#E55738", size = 1)
ggplot2::ggsave("dummy_project/gwas-qc-sample-call-rate.png",
       plot = last_plot())
```

The grey dashed line in Figure \@ref(fig:showsamplecallrate) indicates the mean call rate, while the red dashed line indicates the threshold we had determined above.

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/gwas-qc-sample-callrate.png" alt="Per sample call rate." width="85%" />
<p class="caption">(\#fig:showsamplecallrate)Per sample call rate.</p>
</div>


## Heterozygosity rate

To properly calculate heterozygosity rate and relatedness (identity-by-descent [IBD]) we need to do four things:

1) pre-clean the data to get a high-quality set,
2) of independent SNPs,
3) exclude long-range linkage disequilibrium (LD) blocks that bias with these calculations, and
4) exclude A/T and C/G SNPs as these may be ambivalent in interpretation when frequencies between cases and controls are close (MAF ± 0.45),
5) remove all non-autosomal SNPs.

You can find an up-to-date list of LD blocks you should exclude in these types of analyses [here](https://genome.sph.umich.edu/wiki/Regions_of_high_linkage_disequilibrium_(LD)){target="_blank"} for the different genome builds. In this case we are using build 37. For the purpose of this book we included a file with these regions in the `support`-directory.

We will use the following settings:

- remove A/T and C/G SNPs with the flag `--exclude dummy_project/all.atcg.variants.txt`,
- call rate <1% with the flag `--geno 0.10`,
- Hardy-Weinberg Equilibrium (HWE) p-value > 1x10-3 with the flag `--hwe 1e-3`,
- and MAF>10% with the flag `--maf 0.10 `,
- prune the data to only select independent SNPs (with low LD r^2) of one pair each with `r^2 = 0.2` with the flags `--indep-pairwise 100 10 0.2` and `--extract rawdata/raw-GWA-data.prune.in`,
- SNPs in long-range LD regions (for example: MHC chr 6 25.8-36Mb, chr 8 inversion 6-16Mb, chr17 40-45Mb, and a few more) with the flag `--exclude range support/exclude_problematic_range.txt`,
- remove non-autosomal SNPs with the flag `--autosome`.

First, get a list of A/T and C/G SNPs. Remember, the list of markers for this GWAS is noted in the `.bim` file. We can simply grep all the lines where the two alleles either have an A/T or C/G combination.

```
cat dummy_project/rawdata.bim | \
awk '($5 == "A" && $6 == "T") || ($5 == "T" && $6 == "A") || ($5 == "C" && $6 == "G") || ($5 == "G" && $6 == "C")' | awk '{ print $2, $1, $4, $3, $5, $6 }' \
> dummy_project/all.atcg.variants.txt
```

Second, clean the data and get a list of independent SNPs.

<!-- *NEXT YEAR: further explain the exact commands  and how they relate with the above. Is this needed? * -->

```
plink --bfile dummy_project/rawdata \
--autosome \
--maf 0.10 --geno 0.10 --hwe 1e-3 \
--indep-pairwise 100 10 0.2 \
--exclude range ~/data/shared/support/exclude_problematic_range.txt \
--make-bed --out dummy_project/rawdata.clean.temp
```

> Please note, we have create a dataset without taking into account LD structure. Hence, the message 'Pruned 0 variants from chromosome 1, leaving 19420.' etc. In a dataset without any LD structure this flag `--indep-pairwise 100 10 0.2` doesn't actually work. However, with real-data you can use it to prune out unwanted SNPs in high LD.

Third, exclude the pruned SNPs. Note, how we include a file to exclude high-LD for the purpose of the practical.

```
plink --bfile dummy_project/rawdata.clean.temp \
--extract ~/data/shared/rawdata/raw-GWA-data.prune.in \
--make-bed --out dummy_project/rawdata.clean.ultraclean.temp
```

Fourth, remove the A/T and C/G SNPs.

```
plink --bfile dummy_project/rawdata.clean.ultraclean.temp \
--exclude dummy_project/all.atcg.variants.txt \
--make-bed --out dummy_project/rawdata.clean.ultraclean
```

> Please note, this dataset doesn't actually include this type of SNP, hence `rawdata/all.atcg.variants.txt` is empty! Again, you can use this command in real-data to exclude A/T and C/G SNPs.

Lastly, remove the temporary files.

```
rm -fv dummy_project/*.temp*
```

Finally, we can calculate the heterozygosity rate.

```
plink --bfile dummy_project/rawdata.clean.ultraclean --het --out dummy_project/rawdata.clean.ultraclean
```

This creates the file `dummy_project/rawdata.clean.ultraclean.het`, in which the third column denotes the observed number of homozygous genotypes, O(Hom), and the fifth column denotes the number of nonmissing genotypes, N(NM), per individual. We can now calculate the observed heterozygosity rate per individual using the formula (N(NM) - O(Hom))/N(NM).

Often there is a correlation between heterozygosity rate and missing data. Thus, we should plot the observed heterozygosity rate per individual on the x-axis and the proportion of missing SNP, that is the 'SNP call rate', per individuals on the y-axis (Figure \@ref(fig:showheterozygosity)).


```r
raw_HET <- data.table::fread("dummy_project/rawdata.clean.ultraclean.het")
```




```r
raw_IMISS$logF_MISS = log10(raw_IMISS$F_MISS)
prop_miss = -1.522879

raw_HET$meanHet = (raw_HET$`N(NM)` - raw_HET$`O(HOM)`)/raw_HET$`N(NM)`
lower_meanHet = mean(raw_HET$meanHet) - (3*sd(raw_HET$meanHet))
upper_meanHet = mean(raw_HET$meanHet) + (3*sd(raw_HET$meanHet))

raw_IMISSHET = merge(raw_IMISS, raw_HET, by = "IID")
raw_IMISSHET$FID.y <- NULL
colnames(raw_IMISSHET)[colnames(raw_IMISSHET)=="FID.x"] <- "FID"

colors  <- densCols(raw_IMISSHET$logF_MISS, raw_IMISSHET$meanHet)
```



```r
library("geneplotter")
# you can also use the following code to create the plot
# png("dummy_project/gwas-qc-imiss-vs-het.png")
plot(raw_IMISSHET$logF_MISS,
     raw_IMISSHET$meanHet, 
     col = colors, 
     xlim = c(-3,0), ylim = c(0,0.5),
     pch = 20, 
     xlab = "Proportion of missing genotypes", ylab = "Heterozygosity rate", axes = FALSE)
axis(2, at = c(0,0.05,0.10,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5), tick = TRUE)
axis(1, at = c(-3,-2,-1,0), 
     labels = c(0.001,0.01,0.1,1))
abline(h = lower_meanHet, col = "#E55738", lty = 2)
abline(h = upper_meanHet, col = "#E55738", lty = 2)
abline(v = prop_miss, col = "#E55738", lty = 2)
```

<!-- I prefer to use ggpubr, but I don't understand why this code doesn't work anymore...?!?! -->
<!-- ```{r heterozygosity, eval = FALSE} -->
<!-- ggpubr::ggscatter(raw_IMISSHET, x = "logF_MISS", y = "meanHet", -->
<!--                   colors = colors, -->
<!--                   xlab = "Proportion of missing genotypes", ylab = "Heterozygosity rate") + -->
<!--   scale_x_continuous(labels=c("-3" = "0.001", "-2" = "0.01", -->
<!--                               "-1" = "0.1", "0" = "1")) + -->
<!--   geom_hline(yintercept = lower_meanHet, linetype = "dashed", -->
<!--                 color = "#E55738", size = 1) + -->
<!--   geom_hline(yintercept = upper_meanHet, linetype = "dashed", -->
<!--                 color = "#E55738", size = 1) + -->
<!--   geom_vline(xintercept = prop_miss, linetype = "dashed", -->
<!--                 color = "#E55738", size = 1) -->
<!-- ``` -->

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/show-heterozygosity.png" alt="Heterozygosity as a function of SNP call rate." width="85%" />
<p class="caption">(\#fig:showheterozygosity)Heterozygosity as a function of SNP call rate.</p>
</div>

Examine the plot (Figure \@ref(fig:showheterozygosity)) to decide reasonable thresholds at which to exclude individuals based on elevated missing or extreme heterozygosity. We chose to exclude all individuals with a genotype failure rate >= 0.03 (vertical dashed line) and/or a heterozygosity rate ± 3 s.d. from the mean (horizontal dashed lines). Add the FID and IID of the samples failing this QC to the file named `fail-imisshet-qc.txt`.

> How would you create this file?


```r
raw_IMISSHETsub = subset(raw_IMISSHET, logF_MISS > prop_miss | (meanHet < lower_meanHet | meanHet > upper_meanHet),
                         select = c("FID", "IID"))
data.table::fwrite(raw_IMISSHETsub, "dummy_project/fail-raw_IMISSHETsub.txt", sep =" ")
```



```r
View(raw_IMISSHETsub)
```

If all is right, you'd have something like Table \@ref(tab:failedcallratehet).




```{=html}
<div class="tabwid"><style>.cl-9bb65614{}.cl-9badaa64{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-9bafa81e{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9bafb764{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb76e{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb778{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb779{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb782{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb78c{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb78d{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7aa{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7ab{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7b4{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7b5{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7be{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7bf{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7c8{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7c9{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bafb7d2{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-9bb65614'>

```

<caption style="display:table-caption;">(\#tab:failedcallratehet)<span>Failed samples due to sample call rates and heterozygosity rate.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-9bafb764"><p class="cl-9bafa81e"><span class="cl-9badaa64">FID</span></p></th><th class="cl-9bafb764"><p class="cl-9bafa81e"><span class="cl-9badaa64">IID</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">28</span></p></td><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">28</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb778"><p class="cl-9bafa81e"><span class="cl-9badaa64">50</span></p></td><td class="cl-9bafb778"><p class="cl-9bafa81e"><span class="cl-9badaa64">50</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">52</span></p></td><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">52</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">53</span></p></td><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">53</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb782"><p class="cl-9bafa81e"><span class="cl-9badaa64">67</span></p></td><td class="cl-9bafb782"><p class="cl-9bafa81e"><span class="cl-9badaa64">67</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">96</span></p></td><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">96</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb78c"><p class="cl-9bafa81e"><span class="cl-9badaa64">205</span></p></td><td class="cl-9bafb78c"><p class="cl-9bafa81e"><span class="cl-9badaa64">205</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">298</span></p></td><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">298</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">310</span></p></td><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">310</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">351</span></p></td><td class="cl-9bafb779"><p class="cl-9bafa81e"><span class="cl-9badaa64">351</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb782"><p class="cl-9bafa81e"><span class="cl-9badaa64">404</span></p></td><td class="cl-9bafb782"><p class="cl-9bafa81e"><span class="cl-9badaa64">404</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">418</span></p></td><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">418</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb78c"><p class="cl-9bafa81e"><span class="cl-9badaa64">423</span></p></td><td class="cl-9bafb78c"><p class="cl-9bafa81e"><span class="cl-9badaa64">423</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">428</span></p></td><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">428</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7aa"><p class="cl-9bafa81e"><span class="cl-9badaa64">442</span></p></td><td class="cl-9bafb7aa"><p class="cl-9bafa81e"><span class="cl-9badaa64">442</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7ab"><p class="cl-9bafa81e"><span class="cl-9badaa64">444</span></p></td><td class="cl-9bafb7ab"><p class="cl-9bafa81e"><span class="cl-9badaa64">444</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">548</span></p></td><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">548</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7aa"><p class="cl-9bafa81e"><span class="cl-9badaa64">772</span></p></td><td class="cl-9bafb7aa"><p class="cl-9bafa81e"><span class="cl-9badaa64">772</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">835</span></p></td><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">835</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">850</span></p></td><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">850</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">853</span></p></td><td class="cl-9bafb78d"><p class="cl-9bafa81e"><span class="cl-9badaa64">853</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7b4"><p class="cl-9bafa81e"><span class="cl-9badaa64">910</span></p></td><td class="cl-9bafb7b4"><p class="cl-9bafa81e"><span class="cl-9badaa64">910</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7b4"><p class="cl-9bafa81e"><span class="cl-9badaa64">939</span></p></td><td class="cl-9bafb7b4"><p class="cl-9bafa81e"><span class="cl-9badaa64">939</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">966</span></p></td><td class="cl-9bafb76e"><p class="cl-9bafa81e"><span class="cl-9badaa64">966</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7b5"><p class="cl-9bafa81e"><span class="cl-9badaa64">968</span></p></td><td class="cl-9bafb7b5"><p class="cl-9bafa81e"><span class="cl-9badaa64">968</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,003</span></p></td><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,003</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,006</span></p></td><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,006</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,045</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,045</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,058</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,058</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,154</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,154</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,236</span></p></td><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,236</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,294</span></p></td><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,294</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,395</span></p></td><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,395</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,537</span></p></td><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,537</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,554</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,554</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,587</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,587</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,694</span></p></td><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,694</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,789</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,789</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,832</span></p></td><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,832</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,866</span></p></td><td class="cl-9bafb7bf"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,866</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,904</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,904</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,920</span></p></td><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,920</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,951</span></p></td><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,951</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,952</span></p></td><td class="cl-9bafb7c9"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,952</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,953</span></p></td><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,953</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,954</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,954</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,955</span></p></td><td class="cl-9bafb7be"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,955</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,981</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,981</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,984</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,984</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,985</span></p></td><td class="cl-9bafb7c8"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,985</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bafb7d2"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,986</span></p></td><td class="cl-9bafb7d2"><p class="cl-9bafa81e"><span class="cl-9badaa64">1,986</span></p></td></tr></tbody></table></div>
```


## Relatedness
<!-- https://rpubs.com/EAVWing/symbols -->
We calculate Identity-by-Descent (IBS) to identify duplicated and related samples. In Table \@ref(tab:showrelatedness) we show how much DNA is shared between individuals depending on their relation[@staples2014]. IBS is measured by calculating pi-hat ($\widehat{\pi}$), which is in essence the proportion of the DNA that a pair of samples share. To calculate this, we needed this ultraclean dataset, without low-quality SNPs and without high-LD regions. 





```{=html}
<div class="tabwid"><style>.cl-9bcf15b4{}.cl-9bca1640{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-9bcbf5a0{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9bcbf5aa{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9bcc0428{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0429{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0432{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc043c{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc043d{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0446{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0447{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0450{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc045a{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc045b{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0464{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0465{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc046e{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0478{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0479{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc047a{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0482{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc048c{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc048d{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0496{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0497{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04a0{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04a1{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04aa{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04ab{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04b4{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04b5{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04be{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04c8{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04c9{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04d2{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04d3{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04dc{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04dd{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04de{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04e6{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04f0{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04f1{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04f2{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04fa{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc04fb{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0504{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc050e{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc050f{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0518{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0519{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc051a{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0522{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0523{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc052c{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0536{width:4.109in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0537{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0540{width:0.737in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc0541{width:0.805in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bcc054a{width:0.525in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-9bcf15b4'>

```

<caption style="display:table-caption;">(\#tab:showrelatedness)<span>Familial relations and % DNA shared.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-9bcc0428"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Relatedness</span></p></th><th class="cl-9bcc0429"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">%.DNA.sharing</span></p></th><th class="cl-9bcc0432"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">IBD0</span></p></th><th class="cl-9bcc043c"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">IBD1</span></p></th><th class="cl-9bcc043d"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">IBD2</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-9bcc0446"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Monozygotic twins          </span></p></td><td class="cl-9bcc0447"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±100%</span></p></td><td class="cl-9bcc0450"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0</span></p></td><td class="cl-9bcc045a"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">1</span></p></td><td class="cl-9bcc045b"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc0464"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Parents/child              </span></p></td><td class="cl-9bcc0465"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±50%</span></p></td><td class="cl-9bcc046e"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.25</span></p></td><td class="cl-9bcc0478"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc0479"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.25</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc047a"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Sibling                    </span></p></td><td class="cl-9bcc0482"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±50%</span></p></td><td class="cl-9bcc048c"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.25</span></p></td><td class="cl-9bcc048d"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc0496"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.25</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc0497"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Fraternal twins            </span></p></td><td class="cl-9bcc04a0"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±50%</span></p></td><td class="cl-9bcc04a1"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.25</span></p></td><td class="cl-9bcc04aa"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc04ab"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.25</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc047a"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Grandparent/grandchild     </span></p></td><td class="cl-9bcc0482"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±25%</span></p></td><td class="cl-9bcc048c"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc048d"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc0496"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc04b4"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Aunt/Uncle/Niece/Nephew    </span></p></td><td class="cl-9bcc04b5"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±25%</span></p></td><td class="cl-9bcc04be"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc04c8"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc04c9"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc04d2"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Half-sibling               </span></p></td><td class="cl-9bcc04d3"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±25%</span></p></td><td class="cl-9bcc04dc"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc04dd"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.5</span></p></td><td class="cl-9bcc04de"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc0497"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">First-cousin               </span></p></td><td class="cl-9bcc04a0"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±12.5%</span></p></td><td class="cl-9bcc04a1"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.75</span></p></td><td class="cl-9bcc04aa"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.25</span></p></td><td class="cl-9bcc04ab"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc04e6"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Half first-cousin          </span></p></td><td class="cl-9bcc04f0"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±6.25%</span></p></td><td class="cl-9bcc04f1"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.875</span></p></td><td class="cl-9bcc04f2"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.125</span></p></td><td class="cl-9bcc04fa"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc0464"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">First-cousin once removed  </span></p></td><td class="cl-9bcc0465"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±6.25%</span></p></td><td class="cl-9bcc046e"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.875</span></p></td><td class="cl-9bcc0478"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.125</span></p></td><td class="cl-9bcc0479"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc04fb"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Second-cousin              </span></p></td><td class="cl-9bcc0504"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±3.13%</span></p></td><td class="cl-9bcc050e"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.9375</span></p></td><td class="cl-9bcc050f"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">6.25E-2</span></p></td><td class="cl-9bcc0518"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc04fb"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Second-cousin once removed </span></p></td><td class="cl-9bcc0504"><p class="cl-9bcbf5a0"><span class="cl-9bca1640"> ±1.56%</span></p></td><td class="cl-9bcc050e"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0.96875</span></p></td><td class="cl-9bcc050f"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">3.125E-2</span></p></td><td class="cl-9bcc0518"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc0519"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Distantly related</span></p></td><td class="cl-9bcc051a"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">&lt;1.56%</span></p></td><td class="cl-9bcc0522"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">varies</span></p></td><td class="cl-9bcc0523"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">varies</span></p></td><td class="cl-9bcc052c"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bcc0536"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">Unrelated (includes relationships beyond the third degree)</span></p></td><td class="cl-9bcc0537"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">&lt;1.56%</span></p></td><td class="cl-9bcc0540"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">1</span></p></td><td class="cl-9bcc0541"><p class="cl-9bcbf5a0"><span class="cl-9bca1640">0</span></p></td><td class="cl-9bcc054a"><p class="cl-9bcbf5aa"><span class="cl-9bca1640">0.00</span></p></td></tr></tbody></table></div>
```

`PLINK` calculates the inter-individual relatedness using the `--genome` function.

```
plink --bfile dummy_project/rawdata.clean.ultraclean --genome --out dummy_project/rawdata.clean.ultraclean
```

We can now identify all pairs of individuals with an IBD > 0.185. The code looks at the individual call rates stored in `rawdata.imiss` and outputs the IDs of the individual with the lowest call rate to ‘fail-IBD-QC.txt’ for subsequent removal (Table \@ref(tab:showibdcallissuesbook)).

First, move to the `dummy_project` directory.

```
cd dummy_project
```

Now, execute this script - it should work just fine out-of-the-box.

```
perl ~/data/shared/scripts/run-IBD-QC.pl rawdata rawdata.clean.ultraclean
```

Go back one directory.

```
cd ..
```


```r
ibdcallissues <- data.table::fread("dummy_project/fail-IBD-QC.txt")
names(ibdcallissues)[names(ibdcallissues) == "V1"] <- "FID"
names(ibdcallissues)[names(ibdcallissues) == "V2"] <- "IID"
```


```r
View(ibdcallissues)
```




```{=html}
<div class="tabwid"><style>.cl-9c02373c{}.cl-9bfcf588{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-9bff58aa{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9bff673c{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bff6746{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bff6747{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bff6750{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bff675a{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9bff675b{width:0.568in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-9c02373c'>

```

<caption style="display:table-caption;">(\#tab:showibdcallissuesbook)<span>Failed IBD and callrate.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-9bff673c"><p class="cl-9bff58aa"><span class="cl-9bfcf588">FID</span></p></th><th class="cl-9bff673c"><p class="cl-9bff58aa"><span class="cl-9bfcf588">IID</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-9bff6746"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,952</span></p></td><td class="cl-9bff6746"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,952</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,953</span></p></td><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,953</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff6750"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,954</span></p></td><td class="cl-9bff6750"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,954</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,955</span></p></td><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,955</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,957</span></p></td><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,957</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,959</span></p></td><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,959</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,961</span></p></td><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,961</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,963</span></p></td><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,963</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,965</span></p></td><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,965</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,967</span></p></td><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,967</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,969</span></p></td><td class="cl-9bff675a"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,969</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,971</span></p></td><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,971</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,973</span></p></td><td class="cl-9bff6747"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,973</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9bff675b"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,975</span></p></td><td class="cl-9bff675b"><p class="cl-9bff58aa"><span class="cl-9bfcf588">1,975</span></p></td></tr></tbody></table></div>
```

## Ancestral background

Using a **Principal Component Analysis (PCA)** we can reduce the dimensions of the data, and project the "ancestral distances". In other words, the principal component 1 (the first dimension) and principal component 2 (the second dimension) which will capture most of the variation in the data and represent how much each sample is alike the next. And when compared to a reference, you can deduce the ancestral background of each sample in your dataset. Of course this is relative: we will only know that a given sample is very much a like samples from a given population that _exists today_. 

Nowadays we run such PCA against a large and diverse dataset containing many different populations. Old-school GWAS (pre-2009) would compare a dataset against [HapMap 3](https://www.broadinstitute.org/medical-and-population-genetics/hapmap-3){target="_blank"}, nowadays we prefer at a minimum the [1000G phase 3 populations](https://www.internationalgenome.org){target="_blank"}. And in those ancient times the preferred software to run a PCA was _Eigensoft_ which is a bit tricky to install (see the [GitHub](https://github.com/DReichLab/EIG){target="_blank"}), but nowadays `PLINK` provides the `--pca`-flag. 

For the purpose of this practical primer we will run PCA using `PLINK` and its `--pca`-flag against an earlier version of 1000G, phase 1, which is slightly smaller and just as good to use. 

### 1000G phase 1

We will project our data to the reference, in this example 1000G phase 1 (1000G), which includes individuals from 14 distinct global populations across 4 'super'-populations (Europeans [`EUR`], Africans [`AFR`], East-Asians [`EAS`], and Latin Americans [`AMR`]). In the real-world, using phase 1 may be just fine, but if you think your population evolved through extensive migration it's probably best to use phase 3 data. In other words, the choice of reference is really depending on the dataset.

First, we will merge our data with 1000G. The alleles at each marker must be aligned to the same DNA strand to allow our data to merge correctly. Because not all SNPs are required for this analysis the A->T and C->G SNPs, which are more difficult to align, can be omitted.

#### Filter the 1000G data

First, we should get a list of relevant variants from our `rawdata`-dataset. We don't need the other variants present in the 1000G dataset, right?

```
cat dummy_project/rawdata.bim | grep "rs" > dummy_project/all.variants.txt
```

Extract those from the 1000G phase 1 data.

```
plink --bfile ~/data/shared/ref_1kg_phase1_all/1kg_phase1_all --extract dummy_project/all.variants.txt --make-bed --out dummy_project/1kg_phase1_raw
```

#### Filter A/T & C/G SNPs

As explained, the A/T and C/G SNPs are problematic, we want to exclude these too. So let's get a list of A/T and C/G variants from 1000G to exclude - this may take a while.

```
cat dummy_project/1kg_phase1_raw.bim | \
awk '($5 == "A" && $6 == "T") || ($5 == "T" && $6 == "A") || ($5 == "C" && $6 == "G") || ($5 == "G" && $6 == "C")' | awk '{ print $2, $1, $4, $3, $5, $6 }' \
> dummy_project/all.1kg.atcg.variants.txt
```

Exclude those A/T and C/G variants in both datasets and at the same time filter to only retain high-quality data and exclude non-autosomal variants. 

```
plink --bfile dummy_project/1kg_phase1_raw --exclude dummy_project/all.1kg.atcg.variants.txt -make-bed --out dummy_project/1kg_phase1_raw_no_atcg

plink --bfile dummy_project/rawdata --exclude dummy_project/all.1kg.atcg.variants.txt --make-bed --out dummy_project/rawdata_1kg_phase1_raw_no_atcg
```

#### Merging datasets

Try and merge the data.

```
plink --bfile dummy_project/rawdata_1kg_phase1_raw_no_atcg --bmerge dummy_project/1kg_phase1_raw_no_atcg --make-bed --out dummy_project/rawdata.1kg_phase1
```

There probably is an error ...

```
Error: 72 variants with 3+ alleles present.
* If you believe this is due to strand inconsistency, try --flip with
  dummy_project/rawdata.1kg_phase1-merge.missnp.
  (Warning: if the subsequent merge seems to work, strand errors involving SNPs
  with A/T or C/G alleles probably remain in your data.  If LD between nearby
  SNPs is high, --flip-scan should detect them.)
* If you are dealing with genuine multiallelic variants, we recommend exporting
  that subset of the data to VCF (via e.g. '--recode vcf'), merging with
  another tool/script, and then importing the result; PLINK is not yet suited
  to handling them.
See https://www.cog-genomics.org/plink/1.9/data#merge3 for more discussion.
```

So let's flip some variants.

```
plink --bfile dummy_project/rawdata --exclude dummy_project/all.1kg.atcg.variants.txt --flip dummy_project/rawdata.1kg_phase1-merge.missnp --make-bed --out dummy_project/rawdata_1kg_phase1_raw_no_atcg
```

Let's try again and merge the data.

```
plink --bfile dummy_project/rawdata_1kg_phase1_raw_no_atcg --bmerge dummy_project/1kg_phase1_raw_no_atcg --make-bed --out dummy_project/rawdata.1kg_phase1
```

There still is an error -- there are a few multi-allelic variants present which `PLINK` can't handle. 

```
Error: 14 variants with 3+ alleles present.
* If you believe this is due to strand inconsistency, try --flip with
  dummy_project/rawdata.1kg_phase1-merge.missnp.
  (Warning: if the subsequent merge seems to work, strand errors involving SNPs
  with A/T or C/G alleles probably remain in your data.  If LD between nearby
  SNPs is high, --flip-scan should detect them.)
* If you are dealing with genuine multiallelic variants, we recommend exporting
  that subset of the data to VCF (via e.g. '--recode vcf'), merging with
  another tool/script, and then importing the result; PLINK is not yet suited
  to handling them.
See https://www.cog-genomics.org/plink/1.9/data#merge3 for more discussion.
```

Let's just remove these multi-allelic variants.

```
plink --bfile dummy_project/rawdata_1kg_phase1_raw_no_atcg --exclude dummy_project/rawdata.1kg_phase1-merge.missnp --make-bed --out dummy_project/rawdata_1kg_phase1_raw_no_atcg_bi
```

After removing those pesky multi-allelic variants, we should be able to merge the data. We should take of the following:

- extract the pruned SNP-set (remember?), `--extract rawdata/raw-GWA-data.prune.i`, 
- exclude non-autosomal variants, `--autosome`, 
- and only keeping high-quality data, `--maf 0.10 --geno 0.10 --hwe 1e-3`, 
<!-- THIS CHUNK COULD BE USED TO REMOVE DUPLICATES, BUT IT DOESN'T WORK IN PLINK 1.9 -->
<!-- - remove non-founders from the 1000G data, `--keep-founders`, -->
<!-- - remove any duplicate variants based on SNPID, `--rm-dup force-first` -->
<!-- - and list any duplicate variants based on chromosomal base pair position, `--list-duplicate-vars` -->

```
plink --bfile dummy_project/rawdata_1kg_phase1_raw_no_atcg_bi \
--bmerge dummy_project/1kg_phase1_raw_no_atcg \
--autosome \
--maf 0.10 --geno 0.10 --hwe 1e-3 \
--extract ~/data/shared/rawdata/raw-GWA-data.prune.in \
--make-bed --out dummy_project/rawdata.1kg_phase1.clean
```

<!-- THIS CHUNK COULD BE USED TO REMOVE DUPLICATES, BUT IT DOESN'T WORK IN PLINK 1.9 -->
<!-- ``` -->
<!-- plink --bfile dummy_project/rawdata_1kg_phase1_raw_no_atcg_bi \ -->
<!-- --bmerge ref_1kg_phase1_all/1kg_phase1_raw_no_atcg \ -->
<!-- --autosome \ -->
<!-- --maf 0.10 --geno 0.10 --hwe 1e-3 \ -->
<!-- --extract rawdata/raw-GWA-data.prune.in \ -->
<!-- --list-duplicate-vars \ -->
<!-- --make-bed --out dummy_project/rawdata.1kg_phase1.pruned -->
<!-- ``` -->

<!-- ``` -->
<!-- plink --bfile dummy_project/rawdata.1kg_phase1.pruned \ -->
<!-- --exclude dummy_project/rawdata.1kg_phase1.pruned.dupvar \ -->
<!-- --rm-dup force-first \ -->
<!-- --make-bed --out dummy_project/rawdata.1kg_phase1.clean -->
<!-- ``` -->

Before we continue it's best to clean up a bit of the mess. 

```
rm -fv dummy_project/rawdata_1kg_phase1_raw_no_atcg_bi* dummy_project/1kg_phase1_raw_no_atcg* dummy_project/rawdata.1kg_phase1.pruned* dummy_project/rawdata_1kg_phase1_raw_no_atcg* dummy_project/rawdata.1kg_phase1-merge* dummy_project/rawdata.1kg_phase1.bed dummy_project/rawdata.1kg_phase1.bim dummy_project/rawdata.1kg_phase1.fam dummy_project/rawdata.1kg_phase1.hh dummy_project/rawdata.1kg_phase1.log dummy_project/1kg_phase1_raw.*
```

Now we have prepared our dataset with only high-quality SNPs that have few missing data, that are high-frequent, exclude problematic genomic ranges, and merged to the 1000G phase 1 reference dataset. Your output should look something like this:

```
PLINK v1.90b7.2 64-bit (11 Dec 2023)           www.cog-genomics.org/plink/1.9/
(C) 2005-2023 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to dummy_project/rawdata.1kg_phase1.clean.log.
Options in effect:
  --autosome
  --bfile dummy_project/rawdata_1kg_phase1_raw_no_atcg_bi
  --bmerge ref_1kg_phase1_all/1kg_phase1_raw_no_atcg
  --extract rawdata/raw-GWA-data.prune.in
  --geno 0.10
  --hwe 1e-3
  --maf 0.10
  --make-bed
  --out dummy_project/rawdata.1kg_phase1.clean

16384 MB RAM detected; reserving 8192 MB for main workspace.
2000 people loaded from dummy_project/rawdata_1kg_phase1_raw_no_atcg_bi.fam.
1092 people to be merged from ref_1kg_phase1_all/1kg_phase1_raw_no_atcg.fam.
Of these, 1092 are new, while 0 are present in the base dataset.
Warning: Multiple positions seen for variant 'rs3934834'.
Warning: Multiple positions seen for variant 'rs3737728'.
Warning: Multiple positions seen for variant 'rs6687776'.
Warning: Multiple chromosomes seen for variant 'rs1050301'.
Warning: Multiple chromosomes seen for variant 'rs4850'.
317476 markers loaded from dummy_project/rawdata_1kg_phase1_raw_no_atcg_bi.bim.
312239 markers to be merged from ref_1kg_phase1_all/1kg_phase1_raw_no_atcg.bim.
Of these, 14 are new, while 312225 are present in the base dataset.
312190 more multiple-position warnings: see log file.
Performing single-pass merge (3092 people, 308317 variants).
Merged fileset written to dummy_project/rawdata.1kg_phase1.clean-merge.bed +
dummy_project/rawdata.1kg_phase1.clean-merge.bim +
dummy_project/rawdata.1kg_phase1.clean-merge.fam .
308317 variants loaded from .bim file.
3092 people (1522 males, 1570 females) loaded from .fam.
3092 phenotype values loaded from .fam.
--extract: 49856 variants remaining.
Using 1 thread (no multithreaded calculations invoked).
Before main variant filters, 3078 founders and 14 nonfounders present.
Calculating allele frequencies... done.
Total genotyping rate is 0.994867.
299 variants removed due to missing genotype data (--geno).
--hwe: 13825 variants removed due to Hardy-Weinberg exact test.
2617 variants removed due to minor allele threshold(s)
(--maf/--max-maf/--mac/--max-mac).
33115 variants and 3092 people pass filters and QC.
Phenotype data is quantitative.
--make-bed to dummy_project/rawdata.1kg_phase1.clean.bed +
dummy_project/rawdata.1kg_phase1.clean.bim +
dummy_project/rawdata.1kg_phase1.clean.fam ... done.
```

So in total there are 3,092 individuals, 1,522 males and 1,570 females, and 3,078 founders and 14 non-founders. The total genotyping rate is 99.5% and 33,115 variants are present.


### Principal component analysis

Great, we've prepared our dummy project data and merged this with 1000G phase 1. Let's execute the PCA using `--pca` in `PLINK`.

```
plink --bfile dummy_project/rawdata.1kg_phase1.clean --pca --out dummy_project/rawdata.1kg_phase1.clean
```

### Plotting the PCA results

If all is peachy, you just successfully ran PCA against 1000G phase 1. Using `--pca` we have calculated principal components (PCs), 20 in total by default, and we can now start plotting them. Let's create a scatter diagram of the first two principal components, including all individuals in the file `rawdata.1kg_phase1.clean.eigenvec` (the first and second principal components are columns 3 and 4, respectively). We need to collect some per-sample information to color the points according to sample origin. 

First we collect the results from the `--pca`, the dummy data phenotype information, and the reference population information.


```r
PCA_eigenval <- data.table::fread("dummy_project/rawdata.1kg_phase1.clean.eigenval")
PCA_eigenvec <- data.table::fread("dummy_project/rawdata.1kg_phase1.clean.eigenvec")
ref_pop_raw <- data.table::fread("~/data/shared/ref_1kg_phase1_all/1kg_phase1_all.pheno")
dummy_pop <- data.table::fread("dummy_project/rawdata.fam")
```




```r
# Rename some 
names(PCA_eigenval)[names(PCA_eigenval) == "V1"] <- "Eigenvalue"

names(PCA_eigenvec)[names(PCA_eigenvec) == "V1"] <- "FID"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V2"] <- "IID"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V3"] <- "PC1"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V4"] <- "PC2"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V5"] <- "PC3"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V6"] <- "PC4"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V7"] <- "PC5"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V8"] <- "PC6"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V9"] <- "PC7"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V10"] <- "PC8"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V11"] <- "PC9"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V12"] <- "PC10"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V13"] <- "PC11"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V14"] <- "PC12"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V15"] <- "PC13"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V16"] <- "PC14"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V17"] <- "PC15"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V18"] <- "PC16"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V19"] <- "PC17"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V20"] <- "PC18"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V21"] <- "PC19"
names(PCA_eigenvec)[names(PCA_eigenvec) == "V22"] <- "PC20"

names(dummy_pop)[names(dummy_pop) == "V1"] <- "Family_ID"
names(dummy_pop)[names(dummy_pop) == "V2"] <- "Individual_ID"
names(dummy_pop)[names(dummy_pop) == "V5"] <- "Gender"
names(dummy_pop)[names(dummy_pop) == "V6"] <- "Phenotype"
dummy_pop$V3<- NULL
dummy_pop$V4<- NULL

dummy_pop$Population <- dummy_pop$Phenotype
dummy_pop$Population[dummy_pop$Population == 2] <- "Case"
dummy_pop$Population[dummy_pop$Population == 1] <- "Control"
```


```r
# we subset the data we need
ref_pop <- subset(ref_pop_raw, select = c("Family_ID", "Individual_ID", "Gender", "Phenotype", "Population"))
rm(ref_pop_raw)

# we combine the reference and dummy information
ref_dummy_pop <- rbind(dummy_pop, ref_pop)
```



```r
PCA_1kG <- merge(PCA_eigenvec,
                 ref_dummy_pop,
                 by.x = "IID",
                 by.y = "Individual_ID",
                 sort = FALSE,
                 all.x = TRUE)
```



```r
# Population	Description	Super population	Code	Counts
# ASW	African Ancestry in Southwest US	                          AFR	4	  #49A01D
# CEU	Utah residents with Northern and Western European ancestry	EUR	7	  #E55738
# CHB	Han Chinese in Bejing, China	                              EAS	8	  #9A3480
# CHS	Southern Han Chinese, China	                                EAS	9	  #705296
# CLM	Colombian in Medellin, Colombia	                            MR	10	#8D5B9A
# FIN	Finnish in Finland	                                        EUR	12	#2F8BC9
# GBR	British in England and Scotland	                            EUR	13	#1290D9
# IBS	Iberian populations in Spain	                              EUR	16	#1396D8
# JPT	Japanese in Tokyo, Japan	                                  EAS	18	#D5267B
# LWK	Luhya in Webuye, Kenya	                                    AFR	20	#78B113
# MXL	Mexican Ancestry in Los Angeles, California	                AMR	22	#F59D10
# PUR	Puerto Rican in Puerto Rico	                                AMR	25	#FBB820
# TSI	Toscani in Italy	                                          EUR	27	#4C81BF
# YRI	Yoruba in Ibadan, Nigeria	                                  AFR	28	#C5D220

PCA_1kGplot <- ggpubr::ggscatter(PCA_1kG, 
                                 x = "PC1", 
                                 y = "PC2",
                                 color = "Population", 
                                 palette = c("#49A01D", 
                                             "#595A5C", 
                                             "#E55738", 
                                             "#9A3480", 
                                             "#705296", 
                                             "#8D5B9A", 
                                             "#A2A3A4", 
                                             "#2F8BC9", 
                                             "#1290D9", 
                                             "#1396D8", 
                                             "#D5267B", 
                                             "#78B113", 
                                             "#F59D10", 
                                             "#FBB820", 
                                             "#4C81BF", 
                                             "#C5D220"),
                                 xlab = "principal component 1", ylab = "principal component 2") +
  ggplot2::geom_vline(xintercept = 0.0023, linetype = "dashed",
                      color = "#E55738", size = 1)

p2 <-  ggpubr::ggpar(PCA_1kGplot,
                     title = "Principal Component Analysis",
                     subtitle = "Reference population: 1000 G, phase 1",
                     legend.title = "Populations", legend = "right")
ggplot2::ggsave("dummy_project/gwas-qc-pca-1000g.png", plot = p2)
p2
rm(p2)
```


Derive PC1 and PC2 thresholds so that only individuals who match the given ancestral population are included. For populations of European descent, this will be either the CEU or TSI 1000G individuals (Figure \@ref(fig:showpca1kg)). Here, we chose to exclude all individuals with a first principal component score less than `0.0023`. 

Write the FID and IID of these individuals to a file called `fail-ancestry-QC.txt`.

```
cat dummy_project/rawdata.1kg_phase1.clean.eigenvec | \
awk '$3 < 0.0023' | awk '{ print $1, $2 }' > dummy_project/fail-ancestry-QC.txt
```

Choosing which thresholds to apply (and thus which individuals to remove) is not a straightforward process. The key is to remove those individuals with greatly divergent ancestry, as these samples introduce the most bias to the study. Identification of more fine-scale ancestry can be conducted by using less divergent reference samples (_e.g._, within Europe, stratification could be identified using the CEU, TSI (Italian), GBR (British), FIN (Finnish) and IBS (Iberian) samples from the 1,000 Genomes Project (http://www.1000genomes.org/)). Robust identification of fine-scale population structure often requires the construction of many (2–10) principal components.

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/gwas-qc-pca-1000g.png" alt="PCA - Your data vs. 1000g." width="85%" />
<p class="caption">(\#fig:showpca1kg)PCA - Your data vs. 1000g.</p>
</div>


## Removing samples

Finally! We have a list of samples of poor quality or divergent ancestry, and duplicated or related samples. We should remove these. Let's collect all IDs from our `fail-*`-files into a single file.

```
cat dummy_project/fail-* | sort -k1 | uniq > dummy_project/fail-qc-inds.txt
```

This new file should now contain a list of unique individuals failing the previous QC steps which we want to remove.

```
plink --bfile dummy_project/rawdata --remove dummy_project/fail-qc-inds.txt --make-bed --out dummy_project/clean_inds_data
```

> Question: How many variants and samples are left? How many cases and how many controls did you loose? 

## The next step

Now that you filtered samples, we should turn our attention to step 2 of the QC for GWAS: identify SNPs of poor quality in Chapter \@ref(gwas-basics-snp-qc-cocalc).

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="img/_headers/gwas_sample_qc.png" alt="GWAS basics: Sample QC">' + title.innerHTML
</script>
