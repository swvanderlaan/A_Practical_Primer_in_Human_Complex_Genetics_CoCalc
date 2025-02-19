--- 
title: "A Practical Primer in Human Complex Genetics for CoCalc"
subtitle: "with a use-case in cardiovascular disease"
author: "[dr. Sander W. van der Laan](https://vanderlaanand.science) [![](./img/logo/twitter_circle_blue.png){width=2%}](https://www.twitter.com/swvanderlaan) 
[![](./img/logo/email_circle_blue.png){width=2%}](mailto:s.w.vanderlaan@gmail.com)"
date: "Version 2.2.5 (2024-04-10)"
description: "This is a practical primer in human complex genetics for CoCalc with a use-case in cardiovascular disease. The output format for this primer is a GitBook."
documentclass: book
github-repo: swvanderlaan/A_Practical_Primer_in_Human_Complex_Genetics
link-citations: yes
bibliography:
- bibliography/book.bib
- bibliography/packages.bib
biblio-style: apalike
site: bookdown::bookdown_site
always_allow_html: yes
cover-image: "img/cover/cover_2024.png"
apple-touch-icon: "img/cover/iconified/apple-touch-icon-180x180.png"
apple-touch-icon-size: 180
favicon: "img/cover/iconified/favicon.ico"
---

# About this primer

Ever since the first genome-wide association study (GWAS) on [age-related macular degeneration](https://doi.org/10.1126/science.1109557){target="_blank"}, and the promise of personalized medicine in the wake of the Human Genome Project, large-scale genetic association studies hold significant sway in contemporary health research and [drive drug-development pipelines](http://dx.doi.org/10.1038/nrd.2017.262){target="_blank"}. In the past 2 decades, researchers delved into GWAS, aiming to unveil genetic variations linked to both human traits, such as the color of your eyes, and rare and common complex diseases. These findings serve as crucial keys to unravel the intricate mechanisms underlying diseases, shedding light on whether the correlations identified in observational studies between risk factors and diseases are truly causal. 

These studies have ushered in an exciting era where many researchers thrive on developing new methods and bioinformatic tools to parse ever-growing large datasets collected large population-based biobanks. However, the analyses of these data are challenging and it can be daunting to see the forest for tree among the many tools and their various functions.</br>
Enter _A Practical Primer in Human Complex Genetics_. This [GitBook](https://cjvanlissa.github.io/gitbook-demo/){target="_blank"} was originally written back in 2022 for the **Genetic Epidemiology** course organized by the [Master Epidemiology](https://epidemiology-education.nl){target="_blank"} of Utrecht University. This practical primer will teach you how to design a GWAS, perform quality control (QC), execute the actual analyses, annotate the GWAS results, and perform further downstream post-GWAS analyses. Throughout the book you'll work with 'dummy', that is fake, data, but in the end, we will use real-world data from the first release of the [*Welcome Trust Case-Control Consortium (WTCCC)*](https://www.wtccc.org.uk/ccc1/overview.html){target="_blank"} focusing on coronary artery disease (CAD). 

A major component of modern-day GWAS is [genetic imputation](https://www.nature.com/articles/nrg2796){target="_blank"}, but for practical reasons it is not part of this book. However, I will provide some pointers as to how to go about do this with minimal coding or scripting experience. Likewise, the courses does not cover the aspects of meta-analyses of GWAS, but some excellent resources exist to which I will direct. As this practical primer evolves, these and other topics may find their place in this book. 
I should also point out that emphasis of this book is on it being a _practical primer_. It is intended to provide some practical guidance to doing GWAS, and while theory is important, I will not cover this. Again, some very useful and excellent work exists to which I will point you, but I really want you to learn - and understand the theory - by _doing_. 

So, although originally crafted as a companion for the course, this practical primer stands on its own as a comprehensive resource for diving into all facets of doing a GWAS — save for experimental follow-up, of course 😉.

I can imagine this seems overwhelming, but trust me, you'll be okay. Just follow this practical. You'll learn by doing and at the end of the day, you can execute a GWAS independently.

**Ready to start?**

Your first point of action is to prepare your system for this course in Chapter \@ref(somebackgroundreading).

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/banner_man_standing_dna.png" alt="A Practical Primer in Human Complex Genetics">' + title.innerHTML
</script>
