# Getting started - programs {#getting-started-programs-cocalc}
<!-- ![](./img/headers/women_behind_macbook.png){width=100%} -->






We'll use a few programs throughout this practical. You'll probably need these for your (future) genetic epidemiology work too (Table \@ref(tab:programs)).




```{=html}
<div class="tabwid"><style>.cl-2b0c2382{table-layout:auto;}.cl-2b062360{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-2b08cade{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-2b08dc18{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-2b08dc22{background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-2b08dc2c{background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-2b0c2382'>

```

<caption style="display:table-caption;">(\#tab:programs)<span>Programs needed for genetic epidemiology.</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-2b08dc18"><p class="cl-2b08cade"><span class="cl-2b062360">Program</span></p></th><th class="cl-2b08dc18"><p class="cl-2b08cade"><span class="cl-2b062360">Link</span></p></th><th class="cl-2b08dc18"><p class="cl-2b08cade"><span class="cl-2b062360">Description</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">PLINK</span></p></td><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">https://www.cog-genomics.org/plink2/</span></p></td><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">PLINK is a free, open-source genetic analysis tool set, designed to perform a range of basic data parsing and quality control, as well as basic and large-scale analyses in a computationally efficient manner.</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">R</span></p></td><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">https://cran.r-project.org/</span></p></td><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">A program to perform statistical analysis and visualizations.</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">RStudio</span></p></td><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">https://www.rstudio.com</span></p></td><td class="cl-2b08dc22"><p class="cl-2b08cade"><span class="cl-2b062360">A user-friendly R-wrap-around for code editing, debugging, analyses, and visualization.</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-2b08dc2c"><p class="cl-2b08cade"><span class="cl-2b062360">Homebrew</span></p></td><td class="cl-2b08dc2c"><p class="cl-2b08cade"><span class="cl-2b062360">https://brew.sh</span></p></td><td class="cl-2b08dc2c"><p class="cl-2b08cade"><span class="cl-2b062360">A great extension for Mac-users to install really useful programs that Apple didn't.</span></p></td></tr></tbody></table></div>
```

<!-- This solution works for EPUB - but it makes figures, therefore I would have to adjust all the references.  -->
<!-- ```{r, tab.id = "programscreate", tab.cap = "Programs needed for genetic epidemiology.", eval = TRUE, echo = FALSE, message = FALSE, warning = FALSE, include = FALSE} -->
<!-- set_flextable_defaults(post_process_pdf = TRUE, post_process_html = TRUE, -->
<!--                        table.layout = "autofit") -->
<!-- ft <- flextable(programs) -->
<!-- save_as_image(ft, path = "./img/programs.png") -->
<!-- ``` -->


<!-- ```{r, tab.id = "programs", tab.cap = "Programs needed for genetic epidemiology.", eval = TRUE, echo = FALSE, message = FALSE, warning = FALSE} -->
<!-- knitr::include_graphics("./img/programs.png") -->
<!-- ``` -->

## RStudio
**RStudio** is a very user-friendly interface around `R` that makes your `R`-scripting-life a lot easier. You should get used to that. **RStudio** comes with `R` so you don't have to worry about that.

## PLINK
Right, onto `PLINK`. 

All genetic analyses can be done in PLINK, even on your laptop, but with large datasets, for example [UK Biobank](https://www.ukbiobank.ac.uk){target="_blank"} size, it is better to switch to a [high-performance computing cluster (HPC)](https://en.wikipedia.org/wiki/High-performance_computing){target="_blank"} like we have available at the [Utrecht Science Park](https://wiki.bioinformatics.umcutrecht.nl/bin/view/HPC/WebHome){target="_blank"}. The original PLINK v1.07 can be found [here](https://zzz.bwh.harvard.edu/plink/index.shtml){target="_blank"}, but nowadays we are using a newer, faster version: **PLINK v1.9** which can be found [here](https://www.cog-genomics.org/plink2){target="_blank"}. It still says 'PLINK 1.90 beta' (Figure \@ref(fig:plinkprogram)), but you can consider this version stable and save to work with, but as you can see, some functions are not supported anymore.

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
