# Getting started - programs {#getting-started-programs-cocalc}
<!-- ![](./img/_headers/women_behind_macbook.png){width=100%} -->






We'll use a few programs throughout this practical. You'll probably need these for your (future) genetic epidemiology work too (Table \@ref(tab:programs)).


```r
programs <- openxlsx::read.xlsx("information.xlsx", sheet = "Programs")
```



```r
# knitr::kable(
#   programs,
#   caption = 'Programs needed for genetic epidemiology.',
#   # align = ,
#   booktabs = FALSE
# )

ft <- flextable(
  programs,
  # col_keys = names(data),
  # cwidth = 0.75,
  # cheight = 0.25,
  # defaults = list(),
  theme_fun = theme_booktabs
)
# 
# # set_table_properties(ft, width = 1, layout = "autofit")
# 
# # fit_to_width(ft, max_width = 50)
# 
autofit(ft, add_w = 0, add_h = 0)
```

```{=html}
<div class="tabwid"><style>.cl-8b32d748{}.cl-8b2d0bce{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-8b2f7a4e{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-8b2f8c14{width:0.924in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c15{width:2.716in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c1e{width:14.002in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c1f{width:0.924in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c28{width:2.716in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c29{width:14.002in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c32{width:0.924in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c3c{width:2.716in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-8b2f8c3d{width:14.002in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-8b32d748'>

```

<caption style="display:table-caption;">(\#tab:programs)<span>Programs needed for genetic epidemiology.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-8b2f8c14"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">Program</span></p></th><th class="cl-8b2f8c15"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">Link</span></p></th><th class="cl-8b2f8c1e"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">Description</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-8b2f8c1f"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">PLINK</span></p></td><td class="cl-8b2f8c28"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">https://www.cog-genomics.org/plink2/</span></p></td><td class="cl-8b2f8c29"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">PLINK is a free, open-source genetic analysis tool set, designed to perform a range of basic data parsing and quality control, as well as basic and large-scale analyses in a computationally efficient manner.</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8b2f8c1f"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">R</span></p></td><td class="cl-8b2f8c28"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">https://cran.r-project.org/</span></p></td><td class="cl-8b2f8c29"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">A program to perform statistical analysis and visualizations.</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8b2f8c1f"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">RStudio</span></p></td><td class="cl-8b2f8c28"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">https://www.rstudio.com</span></p></td><td class="cl-8b2f8c29"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">A user-friendly R-wrap-around for code editing, debugging, analyses, and visualization.</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-8b2f8c32"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">Homebrew</span></p></td><td class="cl-8b2f8c3c"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">https://brew.sh</span></p></td><td class="cl-8b2f8c3d"><p class="cl-8b2f7a4e"><span class="cl-8b2d0bce">A great extension for Mac-users to install really useful programs that Apple didn't.</span></p></td></tr></tbody></table></div>
```

## RStudio
**RStudio** is a very user-friendly interface around `R` that makes your `R`-scripting-life a lot easier. You should get used to that. **RStudio** comes with `R` so you don't have to worry about that.

## PLINK
Right, onto `PLINK`. 

All genetic analyses can be done in PLINK, even on your laptop, but with large datasets, for example [UK Biobank](https://www.ukbiobank.ac.uk){target="_blank"} size, it is better to switch to a [high-performance computing cluster (HPC)](https://en.wikipedia.org/wiki/High-performance_computing){target="_blank"} like we have available at the [Utrecht Science Park](https://wiki.bioinformatics.umcutrecht.nl/bin/view/HPC/WebHome){target="_blank"}. The original PLINK v1.07 can be found [here](https://zzz.bwh.harvard.edu/plink/index.shtml){target="_blank"}, but nowadays we are using a newer, faster version: **PLINK v1.9** which can be found [here](https://www.cog-genomics.org/plink2){target="_blank"}. It still says 'PLINK 1.90 beta' (Figure \@ref(fig:plinkprogram)), but you can consider this version stable and save to work with, but as you can see, some functions are not supported anymore.


```r
knitr::include_graphics("./img/plink.png")
```

<div class="figure" style="text-align: center">
<img src="./img/plink.png" alt="The PLINK v1.9 website." width="85%" />
<p class="caption">(\#fig:plinkprogram)The PLINK v1.9 website.</p>
</div>

### Alternatives to `PLINK`
Nowadays, a lot of people also use programs like [SNPTEST](snptest){target="_blank"}, [BOLT-LMM](https://data.broadinstitute.org/alkesgroup/BOLT-LMM/){target="_blank"},  [GCTA](http://cnsgenomics.com/software/gcta/#Overview){target="_blank"}, or [regenie](https://rgcgithub.github.io/regenie/){target="_blank"} as alternatives to execute GWAS. These programs were designed with specific use-cases in mind, for instance really large biobank data including hundreds of thousands individuals, better control for population stratification, the ability to estimate trait heritability or Fst, and so on.

## Other programs
Mendelian randomization can be done either with the [SMR](http://cnsgenomics.com/software/smr/#Overview){target="_blank"} or [GSMR](http://cnsgenomics.com/software/gsmr/){target="_blank"} function from GCTA, or with R-packages, like [`TwoSampleMR`](https://mrcieu.github.io/TwoSampleMR/){target="_blank"}.

As you are following the **Genetic Epidemiology** course, the next thing we'll cover are the **CoCalc**-instructions in Chapter \@ref(getting-started-cocalc).

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/women_behind_macbook.png" alt="Getting started">' + title.innerHTML
</script>
