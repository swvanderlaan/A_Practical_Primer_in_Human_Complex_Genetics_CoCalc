# GWAS visualisation {#gwas-visuals}
<!-- ![](./img/_headers/interactive_plot.png){width=100%} -->





Data visualization is key, not only for presentation but also to inspect the results.

### QQ plots
We should create _quantile-quantile (QQ) plots_ to compare the observed association test statistics with their expected values under the null hypothesis of no association and so assess the number, magnitude and quality of true associations.

First, we will add the standard error, call rate, A2, and allele frequencies.


```
## Key: <SNP>
##           SNP   CHR        BP     A1 NMISS     OR    STAT       P     A2    MAF
##        <char> <int>     <int> <char> <int>  <num>   <num>   <num> <char>  <num>
## 1: rs10000010     4  21227772      C  3996 1.0420  0.9010 0.36760      T 0.4258
## 2: rs10000023     4  95952929      T  3957 0.9902 -0.2160 0.82900      G 0.4841
## 3: rs10000030     4 103593179      A  3991 0.9779 -0.3696 0.71170      G 0.1616
## 4:  rs1000007     2 237416793      C  4000 1.0180  0.3649 0.71520      T 0.3122
## 5: rs10000092     4  21504615      C  3963 0.9240 -1.6770 0.09354      T 0.3430
## 6: rs10000121     4 157793485      G  3919 0.9665 -0.7525 0.45170      A 0.4532
##    NCHROBS callrate
##      <int>    <num>
## 1:    7992  0.99900
## 2:    7914  0.98925
## 3:    7982  0.99775
## 4:    8000  1.00000
## 5:    7926  0.99075
## 6:    7838  0.97975
```

```
## [1] 306102     14
```

```
## # A tibble: 6 × 14
##   SNP        CHR     BP A1    A2      MAF callrate NMISS NCHROBS     BETA     SE
##   <chr>    <int>  <int> <chr> <chr> <dbl>    <dbl> <int>   <int>    <dbl>  <dbl>
## 1 rs10000…     4 2.12e7 C     T     0.426    0.999  3996    7992  0.0411  0.0457
## 2 rs10000…     4 9.60e7 T     G     0.484    0.989  3957    7914 -0.00985 0.0456
## 3 rs10000…     4 1.04e8 A     G     0.162    0.998  3991    7982 -0.0223  0.0605
## 4 rs10000…     2 2.37e8 C     T     0.312    1      4000    8000  0.0178  0.0489
## 5 rs10000…     4 2.15e7 C     T     0.343    0.991  3963    7926 -0.0790  0.0471
## 6 rs10000…     4 1.58e8 G     A     0.453    0.980  3919    7838 -0.0341  0.0453
## # ℹ 3 more variables: OR <dbl>, STAT <dbl>, P <dbl>
```

Let's list the number of SNPs per chromosome. This gives a pretty good idea about the per-chromosome coverage. And it's a sanity check: did the whole analysis run properly (we expect 22 chromosomes)?





> Question: Why do the number of variants per chrosome (approximately) correlate with the chromosome number?

> Question: Where are the data for chromosome X, Y and MT?

Let's plot the QQ plot to diagnose our GWAS. 


<div class="figure" style="text-align: center">
<img src="img/_gwas_dummy/show-qq.png" alt="A QQ plot." width="85%" />
<p class="caption">(\#fig:show-qq)A QQ plot.</p>
</div>

## Manhattan plots

We also need to create a _Manhattan plot_ to display the association test P-values as a function of chromosomal location and thus provide a visual summary of association test results that draw immediate attention to any regions of significance (Figure \@ref(fig:showmanhattan)).



<div class="figure" style="text-align: center">
<img src="img/_gwas_dummy/show-manhattan.png" alt="A manhattan plot." width="85%" />
<p class="caption">(\#fig:showmanhattan)A manhattan plot.</p>
</div>

## Other plots

It is also informative to plot the density per chromosome. We can use the `CMplot` for that which you can find [here](https://github.com/YinLiLin/R-CMplot){target="_blank"}. For now we just make these graphs 'quick-n-dirty', you can further prettify them, but you easily loose track of time, so maybe carry on.






> Question: What do the grey spots on the density plot indicate?

This would lead to the following graphs. 
<div class="figure" style="text-align: center">
<img src="img/_gwas_dummy/show-cmplot-all-density.png" alt="SNP density of the association results." width="85%" />
<p class="caption">(\#fig:showcmplotalldensity)SNP density of the association results.</p>
</div>

<div class="figure" style="text-align: center">
<img src="img/_gwas_dummy/show-cmplot-all-qq.png" alt="A QQ plot including a 95% confidence interval (blue area) and genome-wide significant hits (red)." width="85%" />
<p class="caption">(\#fig:showcmplotallqq)A QQ plot including a 95% confidence interval (blue area) and genome-wide significant hits (red).</p>
</div>

<div class="figure" style="text-align: center">
<img src="img/_gwas_dummy/show-cmplot-all-manhattan.png" alt="A regular manhattan plot. Colored by chromosome, suggestive hits are green, genome-wide hits are red. The bottom graph shows the per-chromosome SNP density." width="85%" />
<p class="caption">(\#fig:showcmplotallmanhattan)A regular manhattan plot. Colored by chromosome, suggestive hits are green, genome-wide hits are red. The bottom graph shows the per-chromosome SNP density.</p>
</div>

<div class="figure" style="text-align: center">
<img src="img/_gwas_dummy/show-cmplot-all-circular.png" alt="A circular manhattan." width="85%" />
<p class="caption">(\#fig:show-cmplot-all-circular)A circular manhattan.</p>
</div>

## Interactive plots

You can also make an [interactive version](https://r-graph-gallery.com/101_Manhattan_plot.html){target="_blank"} of the Manhattan - just because you can. The code below shows you how.


```
library(plotly)
library(dplyr)

# Prepare the dataset (as an example we use the data (gwasResults) from the `qqman`-package)
don <- gwasResults %>%

  # Compute chromosome size
  group_by(CHR) %>%
  summarise(chr_len=max(BP)) %>%

  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  select(-chr_len) %>%

  # Add this info to the initial dataset
  left_join(gwasResults, ., by=c("CHR"="CHR")) %>%

  # Add a cumulative position of each SNP
  arrange(CHR, BP) %>%
  mutate( BPcum=BP+tot) %>%

  # Add highlight and annotation information
  mutate( is_highlight=ifelse(SNP %in% snpsOfInterest, "yes", "no")) %>%

  # Filter SNP to make the plot lighter
  filter(-log10(P)>0.5)

# Prepare X axis
axisdf <- don %>% group_by(CHR) %>% summarize(center=( max(BPcum) + min(BPcum) ) / 2 )

# Prepare text description for each SNP:
don$text <- paste("SNP: ", don$SNP, "\nPosition: ", don$BP, "\nChromosome: ", don$CHR, "\nLOD score:", -log10(don$P) %>% round(2), "\nWhat else do you wanna know", sep="")

# Make the plot
p <- ggplot(don, aes(x=BPcum, y=-log10(P), text=text)) +

    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    scale_color_manual(values = rep(c("grey", "skyblue"), 22 )) +

    # custom X axis:
    scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
    scale_y_continuous(expand = c(0, 0)) +     # remove space between plot area and x axis

    # Add highlighted points
    geom_point(data=subset(don, is_highlight=="yes"), color="orange", size=2) +

    # Custom the theme:
    theme_bw() +
    theme(
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )
ggplotly(p, tooltip="text")
```


It will produce something like this.

![](img/_gwas/interactive_plot.png)


Again, this is an example with dummy data - you can try to do it for our GWAS, but careful with the time. You can also choose to carry on.

You will encounter the above types of visualizations in any high-quality GWAS paper, because each is so critically informative. Usually, analysts of large-scale meta-analyses of GWAS will also stratify the QQ-plots based on the imputation quality (if your GWAS was imputed), call rate, and allele frequency (although that is rarely shared in publications, not even in supplemental material).


## Stop playing around

Alright. It's time to stop playing around and do a quick recap of what you've learned.

1. You learned how to convert datasets.
2. You learned how to execute sample QC and create diagnostic graphics
3. You learned how to do the same for SNP QC
4. You learned how to execute an association study given a dataset, covariates, and different assumptions regarding the genetic model.
5. You learned how to visualize results and played around with different visuals. 

You should be ready for the real stuff. And if not, the next chapter will help you get ready: Chapter \@ref(wtccc1_intro).

<!-- ```{js, echo = FALSE} -->
<!-- title=document.getElementById('header'); -->
<!-- title.innerHTML = '<img src="img/_headers/interactive_plot.png" alt="GWAS basics: visualization">' + title.innerHTML -->
<!-- ``` -->
