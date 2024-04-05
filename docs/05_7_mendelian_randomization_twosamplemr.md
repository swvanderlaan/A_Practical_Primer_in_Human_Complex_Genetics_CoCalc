# Two Sample Mendelian Randomisation {#mr_twosamplemr}
<!-- ![](./img/_headers/banner_man_standing_dna.png){width=100%} -->





So you took the hard way. You want to get your hands dirty yourself. Your choice. 

As I wrote, we will use the `TwoSampleMR` package to assess the causal effect of type 2 diabetes on coronary artery disease and ischemic stroke.

Briefly, the workflow of a Two-Sample MR is as follows (see also diagram below):

1. Select instruments for the exposure (perform LD clumping if necessary)
2. Extract the instruments from the MR Base GWAS database for the outcomes of interest
3. Harmonise the effect sizes for the instruments on the exposures and the outcomes to be each for the same reference allele
4. Perform MR analysis, sensitivity analyses, create plots, compile reports

![](img/twosamplemr.png)

## Loading the package

`TwoSampleMR` is free use. It used to require server-authentication using a gmail-account, now it doesn't anymore. Should run into an issue, please refer to [this page](https://mrcieu.github.io/TwoSampleMR/articles/introduction.html){target="_blank"}.

First we load the package.

```r
library("TwoSampleMR")
library("MRInstruments")
library("ieugwasr")
```


## Available outcome

We are ready to load in the available outcomes. 

```r
ao_twosamplemr <- available_outcomes()
```

## Instruments

The `MRInstruments`-package, which comes with `TwoSampleMR`, includes several types of instruments:

- _gwas_catalog_, which includes data from GWAS collected by the GWAS Catalog
- _metab_qtls_, all known quantitative trait loci (meQTLs) associated to circulating metabolites
- _proteomic_qtls_, all known protein QTLs (pQTLs) associated to circulating protein levels
- _gtex_eqtl_, all known expression QTLs (eQTLs) associated to gene expression in 53 different tissues from GTEx Portal
- _aries_mqtl_, all known methylation QTLs (mQTLs) associated to DNA methylation in blood from ARIES


Let's select T2D associated instruments.


```r
data("gwas_catalog")
t2d_gwas <- subset(gwas_catalog, grepl("Mahajan", Author) & PubmedID == "24509480" & Phenotype == "Type 2 diabetes")
t2d_exp_dat <- format_data(t2d_gwas)
```

## Clumping

Like with identifying independent GWAS hits, it is important for TwoSampleMR to ensure that the instruments for the exposure are independent. We can use MR Base to perform clumping. The European samples from the 1000 genomes project are used to estimate LD between SNPs. You can provide a list of SNP IDs, the SNPs will be extracted from 1000 genomes data, LD calculated between them, and amongst those SNPs that have LD R-square above the specified threshold only the SNP with the lowest P-value will be retained. To do this, use the following command.


```r
t2d_exp_dat <- clump_data(t2d_exp_dat)
```

## Outcomes

Right, so now we are ready to select the proper outcome, CAD. There are multiple datasets available in MRBase, the database used by `TwoSampleMR`. Let's review them all and select one with the largest overlap with our exposure SNPs.


```r
ao_twosamplemr[grepl("heart disease", ao_twosamplemr$trait), ]
```

```
## Rows: 31
## Columns: 25
## $ id           <chr> "ukb-e-I25_CSA", "ukb-e-I25_AFR", "ukb-d-I9_IHD", "ukb-d-…
## $ trait        <chr> "I25 Chronic ischaemic heart disease", "I25 Chronic ischa…
## $ group_name   <chr> "public", "public", "public", "public", "public", "public…
## $ year         <int> 2020, 2020, 2018, 2018, 2018, 2018, 2018, 2018, 2018, 201…
## $ author       <chr> "Pan-UKB team", "Pan-UKB team", "Neale lab", "Neale lab",…
## $ sex          <chr> "Males and Females", "Males and Females", "Males and Fema…
## $ population   <chr> "South Asian", "African American or Afro-Caribbean", "Eur…
## $ unit         <chr> "NA", "NA", "NA", "NA", "NA", "SD", "SD", "SD", "SD", "SD…
## $ sample_size  <int> 8876, 6636, 361194, 361194, 361194, 463010, 463010, 46301…
## $ build        <chr> "HG19/GRCh37", "HG19/GRCh37", "HG19/GRCh37", "HG19/GRCh37…
## $ subcategory  <chr> "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA…
## $ category     <chr> "Binary", "Binary", "Binary", "Binary", "Binary", "Binary…
## $ ontology     <chr> "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA…
## $ doi          <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
## $ note         <chr> "NA", "NA", "NA", "NA", "NA", "41204#I259: Output from GW…
## $ ncase        <int> 1205, 302, 20857, 10157, 10157, 5861, 5771, 9330, 1195, 5…
## $ ncontrol     <int> 7671, 6334, 340337, 351037, 351037, 457149, 457239, 45368…
## $ consortium   <chr> "NA", "NA", "NA", "NA", "NA", "MRC-IEU", "MRC-IEU", "MRC-…
## $ mr           <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
## $ pmid         <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 26343387,…
## $ nsnp         <int> 9811287, 15478580, 13586589, 13295130, 13295130, 9851867,…
## $ coverage     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
## $ study_design <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
## $ priority     <int> 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 3, 0, 0, 0, …
## $ sd           <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
```

It turns out there are several options listed below. 

| Code        | Year        | Author      | Description | Ncases      | Ncontrols |
|-------------|-------------|-------------|-----------|-------------|-------------|
| ukb-d-I9_IHD | 2018 | Neale Labe | Ischaemic heart disease, wide definition | 20857 | 340337 |
| ukb-d-I9_CHD_NOREV | 2018 | Neale Labe | Major coronary heart disease event excluding revascularizations 10157 351037 |
| ieu-a-7 | 2015 | Nikpay _et al._  | Coronary artery disease | 60801 123504 |
| ieu-a-9 | 2013 | Deloukas _et al. _ | Coronary artery disease | 63746 130681 |
| ieu-a-8 | 2011 | Schunkert _et al._ | Coronary artery disease | 22233 | 64762 |

We will use the `ieu-a-7` dataset as this provides the latest and the greatest, but at the same time (when you go into the literature and dig up the publication) you need a good and sharp definition of the outcome you are interested in.



```r
chd_out_dat <- extract_outcome_data(
    snps = t2d_exp_dat$SNP,
    # outcomes = "UKB-a:534" # - this one is deprecated, use the one below
    # Deprecated IDs being used? Detected numeric IDs. Trying to fix, but please note the changes below for future.
    # UKB-a:534  ->  ukb-a-534
    outcomes = "ieu-a-7"
)
```

### Harmonisation

It is important to make sure that the effect allele associated to T2D of any given SNP is the same as the effect allele associated CAD. In other words, we need to harmonise the data.


```r
dat <- harmonise_data(
    exposure_dat = t2d_exp_dat,
    outcome_dat = chd_out_dat
)
```

<!-- ### Drop duplicate datasets -->
<!-- After data harmonisation, users may find that their dataset contains duplicate exposure-outcome summary sets. This can arise, for example, when a GWAS consortium has released multiple results from separate GWAS analyses for the same trait.  -->
<!-- The best thing to do, is to prune the datasets so that only the exposure-outcome combination with the highested expected power is retained.  -->
<!-- In our case we only have 1 dataset for the exposure and 1 for the outcome. But if you don't, you can use the command below. -->

<!-- ```{r MR_powerprune} -->

<!-- dat <- power_prune(dat,  -->
<!--                    method = 1, -->
<!--                    dist.outcome = "binary") -->

<!-- ``` -->

### Mendelian randomisation

Now that the data is harmonised, we are ready to perform a MR and test for a causal relation of T2D with CAD.

```r
res <- mr(dat)

DT::datatable(res, caption = "MR of type 2 diabetes and coronary artery disease", rownames = FALSE)
```

```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-63fdaf948cc29e97fdf2" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-63fdaf948cc29e97fdf2">{"x":{"filter":"none","vertical":false,"caption":"<caption>MR of type 2 diabetes and coronary artery disease<\/caption>","data":[["E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr"],["ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7"],["Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7"],["Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes"],["MR Egger","Weighted median","Inverse variance weighted","Simple mode","Weighted mode"],[50,50,50,50,50],[0.07688428803997334,0.09865534595066436,0.1147545622280697,0.0643204268105102,0.09196445273887566],[0.03902125131072411,0.02513961224166302,0.01885363466619782,0.03811596773025479,0.02525644472420899],[0.05458508583346296,8.698278099685134e-05,1.153325073130974e-09,0.09786515141313644,0.0006533211043445353]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>id.exposure<\/th>\n      <th>id.outcome<\/th>\n      <th>outcome<\/th>\n      <th>exposure<\/th>\n      <th>method<\/th>\n      <th>nsnp<\/th>\n      <th>b<\/th>\n      <th>se<\/th>\n      <th>pval<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[5,6,7,8]},{"name":"id.exposure","targets":0},{"name":"id.outcome","targets":1},{"name":"outcome","targets":2},{"name":"exposure","targets":3},{"name":"method","targets":4},{"name":"nsnp","targets":5},{"name":"b","targets":6},{"name":"se","targets":7},{"name":"pval","targets":8}],"order":[],"autoWidth":false,"orderClasses":false},"selection":{"mode":"multiple","selected":null,"target":"row","selectable":null}},"evals":[],"jsHooks":[]}</script>
```

> Question: What is the causal effect of T2D on CAD? Can you describe this using the knowledge from the lecture and the results in the table.

Several tests are applied. You can change the method(s) applied by using the `method_list` flag. Below a list of available methods.


```r
knitr::kable(mr_method_list(), caption = "Available MR methods", row.names
 = FALSE)
```



Table: (\#tab:MR_methods)Available MR methods

|obj                           |name                                                      |PubmedID |Description                                                 |use_by_default |heterogeneity_test |
|:-----------------------------|:---------------------------------------------------------|:--------|:-----------------------------------------------------------|:--------------|:------------------|
|mr_wald_ratio                 |Wald ratio                                                |         |                                                            |TRUE           |FALSE              |
|mr_two_sample_ml              |Maximum likelihood                                        |         |                                                            |FALSE          |TRUE               |
|mr_egger_regression           |MR Egger                                                  |26050253 |                                                            |TRUE           |TRUE               |
|mr_egger_regression_bootstrap |MR Egger (bootstrap)                                      |26050253 |                                                            |FALSE          |FALSE              |
|mr_simple_median              |Simple median                                             |         |                                                            |FALSE          |FALSE              |
|mr_weighted_median            |Weighted median                                           |         |                                                            |TRUE           |FALSE              |
|mr_penalised_weighted_median  |Penalised weighted median                                 |         |                                                            |FALSE          |FALSE              |
|mr_ivw                        |Inverse variance weighted                                 |         |                                                            |TRUE           |TRUE               |
|mr_ivw_radial                 |IVW radial                                                |         |                                                            |FALSE          |TRUE               |
|mr_ivw_mre                    |Inverse variance weighted (multiplicative random effects) |         |                                                            |FALSE          |FALSE              |
|mr_ivw_fe                     |Inverse variance weighted (fixed effects)                 |         |                                                            |FALSE          |FALSE              |
|mr_simple_mode                |Simple mode                                               |         |                                                            |TRUE           |FALSE              |
|mr_weighted_mode              |Weighted mode                                             |         |                                                            |TRUE           |FALSE              |
|mr_weighted_mode_nome         |Weighted mode (NOME)                                      |         |                                                            |FALSE          |FALSE              |
|mr_simple_mode_nome           |Simple mode (NOME)                                        |         |                                                            |FALSE          |FALSE              |
|mr_raps                       |Robust adjusted profile score (RAPS)                      |         |                                                            |FALSE          |FALSE              |
|mr_sign                       |Sign concordance test                                     |         |Tests for concordance of signs between exposure and outcome |FALSE          |FALSE              |
|mr_uwr                        |Unweighted regression                                     |         |Doesn't use any weights                                     |FALSE          |TRUE               |

### Heterogeneity & Pleiotropy

Many genetic variants are associated to multiple traits, thus _pleiotropy_ is common and widespread in the human genome. This poses as an issue to tease apart causal relations in Mendelian randomisation.
_Vertical pleiotropy_ arises because a SNP influences one trait, which in turn influences another. We can use MR to estimate the causal influence between the traits.
_Horizontal pleiotropy_ arises due to SNPs influencing two traits through independent pathways[@hemani2018].

Further, we should test for study heterogeneity.


```r
mr_heterogeneity(dat)
```

```
##   id.exposure id.outcome                              outcome        exposure
## 1      E8Zobr    ieu-a-7 Coronary heart disease || id:ieu-a-7 Type 2 diabetes
## 2      E8Zobr    ieu-a-7 Coronary heart disease || id:ieu-a-7 Type 2 diabetes
##                      method       Q Q_df      Q_pval
## 1                  MR Egger 82.1911   48 0.001545015
## 2 Inverse variance weighted 84.2921   49 0.001282616
```

```r
mr_pleiotropy_test(dat)
```

```
##   id.exposure id.outcome                              outcome        exposure
## 1      E8Zobr    ieu-a-7 Coronary heart disease || id:ieu-a-7 Type 2 diabetes
##   egger_intercept          se      pval
## 1     0.004478786 0.004043328 0.2735122
```
> Question: What do the results of the heterogeneity and pleiotropy tests tell you?

### Leave-one-out

It is also key to inspect the causal effects per SNP and perform a leave-one-out analysis.


```r
res_single <- mr_singlesnp(dat)
DT::datatable(res_single, caption = "Single SNP MR analysis", rownames = FALSE)
```

```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-f1b209d5dde73d89592b" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-f1b209d5dde73d89592b">{"x":{"filter":"none","vertical":false,"caption":"<caption>Single SNP MR analysis<\/caption>","data":[["Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes"],["Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7"],["E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr"],["ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7"],[184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305],["rs10190052","rs10507349","rs10811661","rs10830963","rs10842994","rs1111875","rs11257655","rs11717195","rs12571751","rs12970134","rs1359790","rs1535500","rs1552224","rs1561927","rs163184","rs17106184","rs17168486","rs17791513","rs1801282","rs2028299","rs2075423","rs2261181","rs2284219","rs2796441","rs2812533","rs2943640","rs319598","rs3802177","rs3923113","rs4273712","rs4402960","rs4458523","rs4812829","rs516946","rs5215","rs6813195","rs6937795","rs702634","rs7041847","rs7163757","rs7178572","rs7612463","rs7756992","rs7845219","rs7903146","rs8108269","rs849135","rs9472138","rs9502570","rs9936385","All - Inverse variance weighted","All - MR Egger"],[0.5026260613698386,-0.003827083897394029,-0.02956237561512185,0.1951609525613853,0.04447786570295988,0.2065440670716583,0.4296459433688768,0.08302612290756013,0.03641313398796977,0.7180126357991714,0.1220751028262359,0.03699138904285938,0.03278577657481476,0.1210422543870856,-0.006416973580416597,0.5159260018284915,0.1338022970621277,0.02243726750269925,0.007593316002798369,0.3493307208987793,-0.05432618813725068,0.1155571985483539,0.03400275502740355,0.2121384379345809,0.2502414751390225,0.4829091727352931,0.2102677901302791,0.07348739808564492,0.5724781166586592,-0.5125828212660249,0.1141570139185963,0.1202631359628167,0.08930122218356704,0.0412967429930438,0.1206324636848207,0.1759721516246797,0.3842867400471791,0.2076064300752268,-0.03119481202634611,-0.04311046973207983,0.1820011760914782,-0.02395336998300787,0.1197444799392142,0.3075582093299984,0.09834986782952219,0.04631972842630711,0.06390262077409339,-0.1592444461162296,-0.03918041496749133,0.2227338182978805,0.1147545622280697,0.07688428803997334],[0.1833512829450189,0.1892209817376563,0.07439230144062853,0.1007167349232685,0.1410759457527537,0.0670676139777666,0.1879544400711644,0.1337527051983217,0.1087566784540624,0.1343575898578362,0.1126280531842297,0.07535328409427415,0.1052614071573938,0.1815221932337506,0.1121601112770935,0.1727150240802821,0.09305776708718259,0.09022121265172356,0.09518258666506883,0.2646407769138595,0.1301931451560929,0.09529982153503218,0.1937890589415917,0.1414955843184642,0.1928238339707468,0.1209454470776964,0.1908048509054313,0.06905403346289307,0.2620095142033454,0.2109093128743163,0.07938789014095275,0.1144286796947634,0.1686451068323659,0.1163548324299434,0.1232909516285857,0.1306739078829712,0.2383842426184385,0.1788192079698961,0.1904031305928713,0.1601385764797014,0.1262132093927731,0.1371437975128745,0.05515968696650281,0.1204687444859378,0.03087981375324252,0.1755945036455896,0.0861802991320544,0.1809249622040227,0.1744755535554099,0.07842812682869275,0.01885363466619782,0.03902125131072411],[0.006119133235678528,0.9838635073547931,0.691083665213385,0.05265724591484638,0.7525520743451679,0.002072513505212175,0.02225983274618345,0.5347684005400913,0.737766262940738,9.089637047026733e-08,0.2784187621830107,0.6234928415677188,0.7554433019838316,0.5048884340418551,0.9543758270633214,0.002815898278593012,0.1504790994923041,0.803599263167614,0.9364151622766309,0.1868288419997573,0.6764781515803353,0.2252962957821061,0.8607160629047251,0.1338066198332572,0.1943655112442493,6.530176024300793e-05,0.2704597475895757,0.2872374795144206,0.02889239290369336,0.01508437222787877,0.1504439619981833,0.2932642347180731,0.5964436834993174,0.7226489719378723,0.327858096272059,0.1780926533161252,0.106951587624932,0.245647972470107,0.8698605619269133,0.7877701825367862,0.1492985109783038,0.8613477493083344,0.02994104137598433,0.01067956664717474,0.001447919007004774,0.7919432576496224,0.4583908313450628,0.3787680545605656,0.8223207620515013,0.004511725199293967,1.153325073130974e-09,0.05458508583346296]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>exposure<\/th>\n      <th>outcome<\/th>\n      <th>id.exposure<\/th>\n      <th>id.outcome<\/th>\n      <th>samplesize<\/th>\n      <th>SNP<\/th>\n      <th>b<\/th>\n      <th>se<\/th>\n      <th>p<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[4,6,7,8]},{"name":"exposure","targets":0},{"name":"outcome","targets":1},{"name":"id.exposure","targets":2},{"name":"id.outcome","targets":3},{"name":"samplesize","targets":4},{"name":"SNP","targets":5},{"name":"b","targets":6},{"name":"se","targets":7},{"name":"p","targets":8}],"order":[],"autoWidth":false,"orderClasses":false},"selection":{"mode":"multiple","selected":null,"target":"row","selectable":null}},"evals":[],"jsHooks":[]}</script>
```

```r
res_loo <- mr_leaveoneout(dat)
DT::datatable(res_loo, caption = "Leave-one-out MR analysis", rownames = FALSE)
```

```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-6c451016e57957fa8310" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-6c451016e57957fa8310">{"x":{"filter":"none","vertical":false,"caption":"<caption>Leave-one-out MR analysis<\/caption>","data":[["Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes","Type 2 diabetes"],["Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7","Coronary heart disease || id:ieu-a-7"],["E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr","E8Zobr"],["ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7","ieu-a-7"],[184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305,184305],["rs10190052","rs10507349","rs10811661","rs10830963","rs10842994","rs1111875","rs11257655","rs11717195","rs12571751","rs12970134","rs1359790","rs1535500","rs1552224","rs1561927","rs163184","rs17106184","rs17168486","rs17791513","rs1801282","rs2028299","rs2075423","rs2261181","rs2284219","rs2796441","rs2812533","rs2943640","rs319598","rs3802177","rs3923113","rs4273712","rs4402960","rs4458523","rs4812829","rs516946","rs5215","rs6813195","rs6937795","rs702634","rs7041847","rs7163757","rs7178572","rs7612463","rs7756992","rs7845219","rs7903146","rs8108269","rs849135","rs9472138","rs9502570","rs9936385","All"],[0.1123557458181299,0.1154428846547127,0.1203519653916966,0.1130826067182098,0.1154918505244955,0.110334888683606,0.1129018724177598,0.1151253184061371,0.1161475044313049,0.1077693761534084,0.1146333400550639,0.1176913204543996,0.1163122675059071,0.1147148829955006,0.1167781216048462,0.1119563029429262,0.1142889483146467,0.1171591032120114,0.1172557262852915,0.1140604127627741,0.116841185990423,0.1147358756775362,0.1152013377173709,0.1137390007042716,0.1139973883328003,0.1094794804573736,0.1142093619731823,0.1166238029907869,0.1133726586863973,0.1176822931089374,0.1147748176553351,0.1146662385862723,0.1149408410459391,0.1158931019254767,0.1146735587918467,0.1140046933618341,0.1137709204283977,0.1141506452308263,0.1155911969619155,0.1160369133984957,0.1138708100449681,0.1162953612608296,0.1143909881127165,0.1119697634133747,0.1192928039125758,0.1152162783475825,0.1162098370360192,0.1164951726822124,0.1158065858764718,0.1110010639792981,0.1147545622280697],[0.01859046036383561,0.01905940466334833,0.01895934983215237,0.01917162765807706,0.01912017406265943,0.0192737729062205,0.01878228685493137,0.01915351649801336,0.01915732159031615,0.01668116074231411,0.01920559555096856,0.01927774028903022,0.0191585512014571,0.0191088884890763,0.0190717377399053,0.01848907139581005,0.01927552188606314,0.01917214778246848,0.0191211935145711,0.01898779542712389,0.01897108817599434,0.01926947470872903,0.01908184445855883,0.01909364218545017,0.01904583040311857,0.01808383899977305,0.01907472560785665,0.01943248483100935,0.01872813328698421,0.01805867573061307,0.0193691745142755,0.01920085337741621,0.01911598941157426,0.0191499263891955,0.01917956041410795,0.01914005471073514,0.01893794196521765,0.0190800741654802,0.0190364533627086,0.01901475228757116,0.0191410376066067,0.01903664233887142,0.01972975851112892,0.01888805644507006,0.02147717069063867,0.01909582159846921,0.01927857648069084,0.0188459815573659,0.01902493014268978,0.01915049180536873,0.01885363466619782],[1.505902972137933e-09,1.386803962794639e-09,2.182807209754178e-10,3.6696464528474e-09,1.538148287015308e-09,1.036698577764039e-08,1.84288792084093e-09,1.847669950881828e-09,1.337504701090068e-09,1.043271200789183e-10,2.390825602008409e-09,1.027767793602622e-09,1.270871361871155e-09,1.934408858530188e-09,9.177313654546608e-10,1.401831091519044e-09,3.043637445919542e-09,9.907001236255142e-10,8.665086077297444e-10,1.889429939033161e-09,7.324827967118417e-10,2.612169473427018e-09,1.567896198931787e-09,2.570605476770073e-09,2.158256338510765e-09,1.412965331091073e-09,2.131292328678109e-09,1.955187292385856e-09,1.416426163559124e-09,7.188897286151251e-11,3.110773241167402e-09,2.344566770120835e-09,1.823330076043023e-09,1.431629949855965e-09,2.245857852249207e-09,2.579477671268748e-09,1.88330122300077e-09,2.194486025276401e-09,1.262503981931878e-09,1.044431615692769e-09,2.69718720291908e-09,1.002403965827884e-09,6.715409843035648e-09,3.065116269105341e-09,2.785664080998996e-08,1.603607668406346e-09,1.660768082944041e-09,6.352231159473936e-10,1.1497666951935e-09,6.781360524654806e-09,1.153325073130974e-09]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>exposure<\/th>\n      <th>outcome<\/th>\n      <th>id.exposure<\/th>\n      <th>id.outcome<\/th>\n      <th>samplesize<\/th>\n      <th>SNP<\/th>\n      <th>b<\/th>\n      <th>se<\/th>\n      <th>p<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[4,6,7,8]},{"name":"exposure","targets":0},{"name":"outcome","targets":1},{"name":"id.exposure","targets":2},{"name":"id.outcome","targets":3},{"name":"samplesize","targets":4},{"name":"SNP","targets":5},{"name":"b","targets":6},{"name":"se","targets":7},{"name":"p","targets":8}],"order":[],"autoWidth":false,"orderClasses":false},"selection":{"mode":"multiple","selected":null,"target":"row","selectable":null}},"evals":[],"jsHooks":[]}</script>
```

> Question: What do the results of the single SNP and leave-one-out analyses tell you?

### Visualisation

It is important to present the causal inference graphically.

**Scatter plot**


```r
res <- mr(dat)
p1 <- mr_scatter_plot(res, dat)
p1
```

```
## $`E8Zobr.ieu-a-7`
```

<img src="05_7_mendelian_randomization_twosamplemr_files/figure-html/MR_visualisation_Scatter-1.png" width="85%" style="display: block; margin: auto;" />

```
## 
## attr(,"split_type")
## [1] "data.frame"
## attr(,"split_labels")
##   id.exposure id.outcome
## 1      E8Zobr    ieu-a-7
```

> Question: What do you see in the scatter plot? And what can you conclude from this?

**Single SNP plot**


```r
res_single <- mr_singlesnp(dat)
p2 <- mr_forest_plot(res_single)
p2
```

```
## $`E8Zobr.ieu-a-7`
```

<img src="05_7_mendelian_randomization_twosamplemr_files/figure-html/MR_visualisation_Single-1.png" width="85%" style="display: block; margin: auto;" />

```
## 
## attr(,"split_type")
## [1] "data.frame"
## attr(,"split_labels")
##   id.exposure id.outcome
## 1      E8Zobr    ieu-a-7
```

> Question: What do you see in the forest plot? And what can you conclude from this?

**Leave-One-Out plot**

```r
res_loo <- mr_leaveoneout(dat)
p3 <- mr_leaveoneout_plot(res_loo)
p3
```

```
## $`E8Zobr.ieu-a-7`
```

<img src="05_7_mendelian_randomization_twosamplemr_files/figure-html/MR_visualisation_LOO-1.png" width="85%" style="display: block; margin: auto;" />

```
## 
## attr(,"split_type")
## [1] "data.frame"
## attr(,"split_labels")
##   id.exposure id.outcome
## 1      E8Zobr    ieu-a-7
```

> Question: what does a leave-one-out ploy tell you? And what can you conclude from this?

**Funnel plot**

```r
res_single <- mr_singlesnp(dat)
p4 <- mr_funnel_plot(res_single)
p4
```

```
## $`E8Zobr.ieu-a-7`
```

<img src="05_7_mendelian_randomization_twosamplemr_files/figure-html/MR_visualisation_Funnel-1.png" width="85%" style="display: block; margin: auto;" />

```
## 
## attr(,"split_type")
## [1] "data.frame"
## attr(,"split_labels")
##   id.exposure id.outcome
## 1      E8Zobr    ieu-a-7
```

> Question: Why would yoy use a funnel plot? And what can it tell you? 

<!-- ### Editing the results -->

<!-- You can edit the results to summarize them in a nice table.  -->

<!-- ```{r MR_editing, echo = TRUE, eval = TRUE} -->
<!-- generate_odds_ratios(res) -->

<!-- res <- mr(dat) -->
<!-- het <- mr_heterogeneity(dat) -->
<!-- plt <- mr_pleiotropy_test(dat) -->
<!-- sin <- mr_singlesnp(dat) -->

<!-- all_res <- combine_all_mrresults(res, het, -->
<!--                                plt, sin, -->
<!--                                ao_slc = TRUE, -->
<!--                                Exp=TRUE, -->
<!--                                split.exposure = FALSE, -->
<!--                                split.outcome = TRUE) -->

<!-- head(all_res[,c("Method","outcome","exposure","nsnp","b","se","pval","intercept","intercept_se","intercept_pval","Q","Q_df","Q_pval","consortium","ncase","ncontrol","pmid","population")]) -->

<!-- DT::datatable(all_res) -->
<!-- ``` -->

> Question: What are your main conclusions from the MR analysis?

## The end?

You are almost at the end. Time to return to the previous chapter on post-GWAS analyses \@ref(post_gwas).

<!-- ```{js, echo = FALSE} -->
<!-- title=document.getElementById('header'); -->
<!-- title.innerHTML = '<img src="img/_headers/banner_man_standing_dna.png" alt="TwoSample Mendelian Randomization">' + title.innerHTML -->
<!-- ``` -->
