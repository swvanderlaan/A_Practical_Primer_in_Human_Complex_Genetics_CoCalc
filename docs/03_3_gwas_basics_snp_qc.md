# Per-SNP QC {#gwas_basics_snp_qc}
<!-- ![](./img/_gwas_dummy/gwas_snp_qc.png){width=70%} -->






Now that we removed samples, we can focus on low-quality variants.

## SNP call rates

We start by calculating the missing genotype rate for each SNP, in other words the per-SNP call rate.

```
plink --bfile dummy_project/clean_inds_data --missing --out dummy_project/clean_inds_data
```

Let's visualize the results to identify a threshold for extreme genotype failure rate. We chose a callrate threshold of 3%, but it's arbitrary and depending on the dataset, the data (visualization), and the number of samples (Figure \@ref(fig:showsnpcallrate)).






\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{img/_gwas_dummy/show-snp-callrate} 

}

\caption{Per SNP call rate.}(\#fig:showsnpcallrate)
\end{figure}

## Differential SNP call rates

There could also be differences in genotype call rates between cases and controls. It is very important to check for this because these differences could lead to spurious associations. We can test all markers for differences in call rate between cases and controls, or based on other criteria.

```
plink --bfile dummy_project/clean_inds_data --test-missing --out dummy_project/clean_inds_data
```

Let's collect all the SNPs with a significantly different (P < 0.00001) missing data rate between cases and controls.

```
cat dummy_project/clean_inds_data.missing | awk '$5 < 0.00001' | awk '{ print $2 }' > dummy_project/fail-diffmiss-qc.txt
```

## Allele frequencies

We should also get an idea on what the allele frequencies are in our dataset. Low frequent SNPs should probably be excluded, as these are uninformative when monomorphic (allele frequency = 0), or they may lead to spurious associations.

```
plink --bfile dummy_project/clean_inds_data --freq --out dummy_project/clean_inds_data
```

Let's also plot these data. You can view the result below, and try it yourself (Figure \@ref(fig:showfreq)).





\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{img/_gwas_dummy/show-freq} 

}

\caption{Minor allele frequency.}(\#fig:showfreq)
\end{figure}

### A note on allele coding

Oh, one more thing about alleles. 

`PLINK` codes alleles as follows:

A1 = minor allele, the least frequent allele
A2 = major allele, the most frequent allele

And when you use `PLINK` the flag `--freq` or `--maf` is always relative to the A1-allele, as is the odds ratio (OR) or effect size (beta).

However, `SNPTEST` makes use of the so-called OXFORD-format, this codes alleles as follows:

A = the 'other' allele
B = the 'coded' allele

When you use `SNPTEST` it will report the allele frequency as `CAF`, in other words the _coded allele frequency_, and the effect size (beta) is always relative to the B-allele. This means, `CAF` _could_ be the `MAF`, or _minor allele frequency_, but this is **not** a given.

In other words, always make sure what the allele-coding of a given program, be it `PLINK`, `SNPTEST`, `GCTA`, _et cetera_, is! I cannot stress this enough. Ask yourself: 'what is the allele frequency referring to?', 'the effect size is relative to...?'.

Right, let's continue.

## Hardy-Weinberg Equilibrium

Because we are performing a case-control genome-wide association study, we probably expect some differences in Hardy-Weinberg Equilibrium (HWE), but extreme deviations are probably indicative of genotyping errors.

```
plink --bfile dummy_project/clean_inds_data --hardy --out dummy_project/clean_inds_data
```

Let's also plot these data. You can view the result below, and type over the code to do it yourself.






\begin{figure}[H]

{\centering \includegraphics[width=0.85\linewidth]{img/_gwas_dummy/show-hwe} 

}

\caption{Hardy-Weinberg Equilibrium p-values per stratum.}(\#fig:showhwe)
\end{figure}

## Final SNP QC

We are ready to perform the final QC. After inspecting the graphs we will filter on a MAF < 0.01, call rate < 0.05, and HWE < 0.00001 (Figure \@ref(fig:showhwe)), in addition those SNPs that failed the differential call rate test will be removed.

```
plink --bfile dummy_project/clean_inds_data --exclude dummy_project/fail-diffmiss-qc.txt --maf 0.01 --geno 0.05 --hwe 0.00001 --make-bed --out dummy_project/cleandata
```

## A Milestone

Congratulations. You reached a very important milestone. Now that you filtered samples and SNPs, we can finally start the association analyses in Chapter \@ref(gwas_testing).

<!-- ```{js, echo = FALSE} -->
<!-- title=document.getElementById('header'); -->
<!-- title.innerHTML = '<img src="img/_headers/gwas_snp_qc.png" alt="GWAS basics: SNP QC">' + title.innerHTML -->
<!-- ``` -->
