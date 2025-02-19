# Functional Mapping and Annotation of GWAS {#fuma}
<!-- ![](./img/_headers/banner_man_standing_dna.png){width=100%} -->





## Assignment

### Tutorial

Go to the [FUMA website](https://fuma.ctglab.nl){target="_blank"}, get an account, and study the [online-tutorial](https://fuma.ctglab.nl/tutorial){target="_blank"}.


### Create the input

You will need to use the `fwrite` function in `r` to write the concatenated results of the WTCCC1 study (remember: `wtccc1_assoc_compl`). Make sure you know what the column-names are in the file, you'll need that for FUMA. You will also need to compress the resulting output, this will make uploading to FUMA go faster. Next, you can download this file and upload it to FUMA.

> Question: can you figure out the sample size of the WTCCC1 data you used?


### Run FUMA - SNP to gene

For you convenience, I have already created this file `wtccc1/wtccc1_assoc_compl.txt.gz` which you should download and upload to [FUMA](https://fuma.ctglab.nl/jobs){target="_blank"}. Since you've studied the tutorial you are familiar with its options. 

Select _everything_ in the tabs `Gene Mapping (positional mapping)`, `Gene Mapping (eQTL mapping)` but *not* `GTEx v6` and `GTEx v7`, and `Gene Mapping (3D Chromatin Interaction mapping)` and leave the settings at `Gene types` and `MHC region` as-is. At `MAGMA analysis` set the _MAGMA gene expression analysis_ to include all tissues, *but* `GTEx v6` and `GTEx v7`. 

Don't forget to give your analysis a name. The whole analysis will take about 5-10 minutes depending on the traffic on the server. 

This will take some time and so it's a good moment to carry on with the rest of the practical or take a break, or study for the exam.

> Questions
> 
> 1. How many lead SNPs did we find?
> 2. What do the results of MAGMA (the gene-based test) look like and how many genes pass the threshold of multiple testing correction?
> 3. How many loci were mapped?
> 4. How many genes were physically located and how many were mapped to these loci?
> 5. Do you think all loci are 'correct', _i.e._ do you 'believe' all the signals looking at the mapping results? Why?
> 6. For what tissues are the signals enriched?
> 7. Are there any chromatin interactions discovered?

### Run FUMA - Gene to function

Now that you mapped SNPs to genes, it's time to go back to 'My Jobs'. Select your job and perform `GENE2FUNC`.

> Questions
> 
> 1. What genes show the lowest expression across tissues?
> 2. And what genes the highest?
> 3. For what pathways are the signals enriched?
> 4. What molecular functions are mapped to the signals?


## Some closing thoughts

FUMA is a great tool, but it comes with a caveat. It includes a couple of references of which it is not readily clear which variants are included - the authors do provide the codes used on Git, but still, you don't know which variants precisely are filtered. That is key: perhaps the top variant you discovered is filtered in the reference. This means FUMA will not use it to map SNPs to genes, rather next best variant. This should be in high-LD - but, again, assumptions... And of course, the references used might not match your data well enough. 
So, my advice: use FUMA (why not be lazy rather than work hard?), but aware of such caveats as I described. All in all, I do think FUMA is very complete, intuitive, and it makes your work publication-ready because it creates just the right file-formats for you too (`.png`, `.svg`, `.pdf`, `.jpeg`).

That said, time to move on to inspect other phenotypes in relation to your findings in the next Chapter \@ref(phewas) or to return to the previous chapter on post-GWAS analyses \@ref(post-gwas).

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/banner_man_standing_dna.png" alt="FUMA">' + title.innerHTML
</script>
