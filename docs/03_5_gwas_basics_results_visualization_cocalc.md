# GWAS visualisation {#gwas-visuals-cocalc}
<!-- ![](./img/_headers/interactive_plot.png){width=100%} -->





Data visualization is key, not only for presentation but also to inspect the results.

### QQ plots
We should create _quantile-quantile (QQ) plots_ to compare the observed association test statistics with their expected values under the null hypothesis of no association and so assess the number, magnitude and quality of true associations.

First, we will add the standard error, call rate, A2, and allele frequencies.


```r
library("data.table")
gwas_FRQ <- data.table::fread("dummy_project/gwa.frq")

gwas_LMISS <- data.table::fread("dummy_project/gwa.lmiss")

gwas_assoc <- data.table::fread("dummy_project/data.assoc.logistic")

gwas_LMISS$callrate <- 1 - gwas_LMISS$F_MISS

gwas_assoc_sub <- subset(gwas_assoc, TEST == "ADD")
gwas_assoc_sub$TEST <- NULL

temp <- subset(gwas_FRQ, select = c("SNP", "A2", "MAF", "NCHROBS"))

gwas_assoc_subfrq <- merge(gwas_assoc_sub, temp, by = "SNP")

temp <- subset(gwas_LMISS, select = c("SNP", "callrate"))

gwas_assoc_subfrqlmiss <- merge(gwas_assoc_subfrq, temp, by = "SNP")
head(gwas_assoc_subfrqlmiss)
# Remember:
# - that z = beta/se
# - beta = log(OR), because log is the natural log in r

gwas_assoc_subfrqlmiss$BETA = log(gwas_assoc_subfrqlmiss$OR)
gwas_assoc_subfrqlmiss$SE = gwas_assoc_subfrqlmiss$BETA/gwas_assoc_subfrqlmiss$STAT


gwas_assoc_subfrqlmiss_tib <- dplyr::as_tibble(gwas_assoc_subfrqlmiss)

col_order <- c("SNP", "CHR", "BP",
               "A1", "A2", "MAF", "callrate", "NMISS", "NCHROBS",
               "BETA", "SE", "OR", "STAT", "P")
gwas_assoc_compl <- gwas_assoc_subfrqlmiss_tib[, col_order]

dim(gwas_assoc_compl)

head(gwas_assoc_compl)

data.table::fwrite(gwas_assoc_compl, "dummy_project/gwas_assoc_compl.txt",
                   sep = "\t", quote = FALSE, row.names = FALSE)
```



Let's list the number of SNPs per chromosome. This gives a pretty good idea about the per-chromosome coverage. And it's a sanity check: did the whole analysis run properly (we expect 22 chromosomes)?


```r
df <- as.data.frame(table(gwas_assoc_compl$CHR))
names(df)[names(df) == "Var1"] <- "Chr"
```


```{=html}
<div class="tabwid"><style>.cl-ac120148{}.cl-ac0c67b0{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-ac0e980a{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-ac0e9814{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-ac0ea926{width:0.431in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea927{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea930{width:0.431in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea93a{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea93b{width:0.431in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea944{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea945{width:0.431in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea94e{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea958{width:0.431in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea959{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea962{width:0.431in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-ac0ea963{width:0.652in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-ac120148'>

```

<caption style="display:table-caption;">(\#tab:listsnpsperchr)<span>Number of SNPs per chromosome.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-ac0ea926"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">Chr</span></p></th><th class="cl-ac0ea927"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">Freq</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">1</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">23,173</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea93b"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">2</span></p></td><td class="cl-ac0ea944"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">25,206</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">3</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">21,402</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea945"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">4</span></p></td><td class="cl-ac0ea94e"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">19,008</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea958"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">5</span></p></td><td class="cl-ac0ea959"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">19,157</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea93b"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">6</span></p></td><td class="cl-ac0ea944"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">20,672</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea93b"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">7</span></p></td><td class="cl-ac0ea944"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">16,581</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea945"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">8</span></p></td><td class="cl-ac0ea94e"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">18,089</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea958"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">9</span></p></td><td class="cl-ac0ea959"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">15,709</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea93b"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">10</span></p></td><td class="cl-ac0ea944"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">15,536</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea93b"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">11</span></p></td><td class="cl-ac0ea944"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">14,564</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea945"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">12</span></p></td><td class="cl-ac0ea94e"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">14,889</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">13</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">11,524</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">14</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">9,822</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea945"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">15</span></p></td><td class="cl-ac0ea94e"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">8,838</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">16</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">8,920</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea93b"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">17</span></p></td><td class="cl-ac0ea944"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">8,262</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea93b"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">18</span></p></td><td class="cl-ac0ea944"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">10,356</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">19</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">5,820</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">20</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">7,792</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea930"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">21</span></p></td><td class="cl-ac0ea93a"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">5,412</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-ac0ea962"><p class="cl-ac0e980a"><span class="cl-ac0c67b0">22</span></p></td><td class="cl-ac0ea963"><p class="cl-ac0e9814"><span class="cl-ac0c67b0">5,370</span></p></td></tr></tbody></table></div>
```

> Question: Try to figure out how to get the number of variants per chromosomes. Why do the number of variants per chrosome (approximately) correlate with the chromosome number?

> Question: Where are the data for chromosome X, Y and MT?

Let's plot the QQ plot to diagnose our GWAS.

Since we're working in Utrecht on the Utrecht Science Park, let's get the color scheme in `R`. 


```r
uithof_color = c("#FBB820","#F59D10","#E55738","#DB003F","#E35493","#D5267B",
                 "#CC0071","#A8448A","#9A3480","#8D5B9A","#705296","#686AA9",
                 "#6173AD","#4C81BF","#2F8BC9","#1290D9","#1396D8","#15A6C1",
                 "#5EB17F","#86B833","#C5D220","#9FC228","#78B113","#49A01D",
                 "#595A5C","#A2A3A4", "#D7D8D7", "#ECECEC", "#FFFFFF", "#000000")
```


```r
library("qqman")

gwas_threshold = -log10(5e-8)

# you could save the image, or just display it
# png("dummy_project/gwas-qq.png")
qqman::qq(gwas_assoc_compl$P, main = "QQ plot of GWAS",
          xlim = c(0, 7),
          ylim = c(0, 12),
          pch = 20, col = uithof_color[16], cex = 1.5, las = 1, bty = "n")
abline(h = gwas_threshold,
       col = uithof_color[25], lty = "dashed")
```

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/show-qq.png" alt="A QQ plot." width="85%" />
<p class="caption">(\#fig:show-qq)A QQ plot.</p>
</div>

## Manhattan plots

We also need to create a _Manhattan plot_ to display the association test P-values as a function of chromosomal location and thus provide a visual summary of association test results that draw immediate attention to any regions of significance (Figure \@ref(fig:showmanhattan)).


```r
# you could save the image, or just display it
# png(paste0(COURSE_loc, "/dummy_project/gwas-manhattan.png"))
qqman::manhattan(gwas_assoc_compl, main = "Manhattan Plot",
                 ylim = c(0, 12),
                 cex = 0.6, cex.axis = 0.9,
                 col = c(uithof_color[16], uithof_color[24]))
```

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/show-manhattan.png" alt="A manhattan plot." width="85%" />
<p class="caption">(\#fig:showmanhattan)A manhattan plot.</p>
</div>

## Other plots

It is also informative to plot the density per chromosome. We can use the `CMplot` for that which you can find [here](https://github.com/YinLiLin/R-CMplot){target="_blank"}. For now we just make these graphs 'quick-n-dirty', you can further prettify them, but you easily loose track of time, so maybe carry on.


```r
gwas_assoc_complsub <- subset(gwas_assoc_compl, select = c("SNP", "CHR", "BP", "P"))
```



```r
library("CMplot")

CMplot(gwas_assoc_complsub,
       plot.type = c("d", "c", "m", "q"), LOG10 = TRUE, ylim = NULL,
       threshold = c(1e-6,1e-4), threshold.lty = c(1,2), threshold.lwd = c(1,1), threshold.col = c("black", "grey"),
       amplify = TRUE,
       bin.size = 1e6, chr.den.col = c("darkgreen", "yellow", "red"),
       signal.col = c("red", "green"), signal.cex = c(1,1), signal.pch = c(19,19),
       file.output = FALSE, file = "png", 
       main = "", dpi = 300, verbose = TRUE)
```

> Question: What do the grey spots on the density plot indicate?

This would lead to the following graphs. 
<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/show-cmplot-all-density.png" alt="SNP density of the association results." width="85%" />
<p class="caption">(\#fig:showcmplotalldensity)SNP density of the association results.</p>
</div>

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/show-cmplot-all-qq.png" alt="A QQ plot including a 95% confidence interval (blue area) and genome-wide significant hits (red)." width="85%" />
<p class="caption">(\#fig:showcmplotallqq)A QQ plot including a 95% confidence interval (blue area) and genome-wide significant hits (red).</p>
</div>

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/show-cmplot-all-manhattan.png" alt="A regular manhattan plot. Colored by chromosome, suggestive hits are green, genome-wide hits are red. The bottom graph shows the per-chromosome SNP density." width="85%" />
<p class="caption">(\#fig:showcmplotallmanhattan)A regular manhattan plot. Colored by chromosome, suggestive hits are green, genome-wide hits are red. The bottom graph shows the per-chromosome SNP density.</p>
</div>

<div class="figure" style="text-align: center">
<img src="img/gwas_dummy/show-cmplot-all-circular.png" alt="A circular manhattan." width="85%" />
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


It will produce something like below. In the CoCalc Notebook-window it isn't smooth, but this way you have an idea how to do it in a real-case scenario.

![](img/gwas/interactive_plot.png)


Again, this is an example with dummy data - you can try to do it for our GWAS, but careful with the time. You can also choose to carry on.

You will encounter the above types of visualizations in any high-quality GWAS paper, because each is so critically informative. Usually, analysts of large-scale meta-analyses of GWAS will also stratify the QQ-plots based on the imputation quality (if your GWAS was imputed), call rate, and allele frequency (although that is rarely shared in publications, not even in supplemental material).


## Getting up close

Now that you created a Manhattan and diagnostic QQ plot, it would be nice to see the loci we found a bit more up and close. 

In the next Chapter \@ref(regional_plot_cocalc) we will show you how to create regional plots. 

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="img/headers/interactive_plot.png" alt="GWAS basics: visualization">' + title.innerHTML
</script>
