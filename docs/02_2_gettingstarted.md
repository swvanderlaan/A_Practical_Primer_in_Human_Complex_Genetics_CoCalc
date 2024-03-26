# Getting started {#getting-started}
![](./img/_headers/women_behind_macbook.png){width=100%}



```
## 
## Packages to install for this book and its contents to automagically work.
## 
## * Bookdown and rmarkdown packages...
## 
## * General packages...
## 
## * GGplotting packages - for publication ready plotting...
## 
## * Genomic packages...
```

> [THIS CHAPTER NEEDS WORK]
> - introduction
> - briefly touch on operating system
> - split CoCalc vs standalone
>   - CoCalc: everything is installed
>   - standalone: 
>     - focus on macOS
>     - what to install
>     - show how to navigate on macOS Terminal
> [Some introductory text]

Before getting started, we need to discuss your computer. Most programs made to execute genetic epidemiology studies are developed for the Unix environment, for example Linux and macOS. So, they may not work as intended in a Windows environment. Windows does allow users to install a linux subsystem within Windows 10+ and you can find the detail [guide](https://docs.microsoft.com/en-us/windows/wsl/about){target="_blank"} here.  

However, I highly recommend one of two options. 

- One, install a linux subsystem on your Windows computer (for example [a virtual machine with Ubuntu could work](https://blog.storagecraft.com/the-dead-simple-guide-to-installing-a-linux-virtual-machine-on-windows/){target="_blank"}). 
- Two, switch to macOS in combination with [homebrew](https://brew.sh){target="_blank"}. This will give you all the flexibility to use Unix-based programs for your genetic epidemiology work and at the same time you'll keep the advantage of a powerful computer with a user-friendly interface.

I chose the latter. 

> For this practical every command is intended for Linux/macOS, in other words Unix-systems.

**CoCalc vs. Standalone**
For the purpose of this practical primer there are one of two steps you need to take to get started. When you are following the course, you will want to read the section **CoCalc**. When you want to use this book as a standalone, you should check out the instructions in section **Standalone** - this is probably also the section you want to follow for real-world cases. 

But first, I'll briefly provide some background on the variaous programs that are commonly used.

## The programs we use

We'll use a few programs throughout this practical. You'll probably need these for your (future) genetic epidemiology work too (Table \@ref(tab:programs)).





Table: (\#tab:programs)Programs needed for genetic epidemiology.

|Program  |Link                                 |Description                                                                                                                                                                                                     |
|:--------|:------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|PLINK    |https://www.cog-genomics.org/plink2/ |PLINK is a free, open-source genetic analysis tool set, designed to perform a range of basic data parsing and quality control, as well as basic and large-scale analyses in a computationally efficient manner. |
|R        |https://cran.r-project.org/          |A program to perform statistical analysis and visualizations.                                                                                                                                                   |
|RStudio  |https://www.rstudio.com              |A user-friendly R-wrap-around for code editing, debugging, analyses, and visualization.                                                                                                                         |
|Homebrew |https://brew.sh                      |A great extension for Mac-users to install really useful programs that Apple didn't.                                                                                                                            |

**RStudio**

**RStudio** is a very user-friendly interface around `R` that makes your `R`-scripting-life a lot easier. You should get used to that. **RStudio** comes with `R` so you don't have to worry about that.

**PLINK**
Right, onto `PLINK`. 

All genetic analyses can be done in PLINK, even on your laptop, but with large datasets, for example [UK Biobank](https://www.ukbiobank.ac.uk){target="_blank"} size, it is better to switch to a [high-performance computing cluster (HPC)](https://en.wikipedia.org/wiki/High-performance_computing){target="_blank"} like we have available at the [Utrecht Science Park](https://wiki.bioinformatics.umcutrecht.nl/bin/view/HPC/WebHome){target="_blank"}. The original PLINK v1.07 can be found [here](https://zzz.bwh.harvard.edu/plink/index.shtml){target="_blank"}, but nowadays we are using a newer, faster version: **PLINK v1.9** which can be found [here](https://www.cog-genomics.org/plink2){target="_blank"}. It still says 'PLINK 1.90 beta' (Figure \@ref(fig:plink)), but you can consider this version stable and save to work with, but as you can see, some functions are not supported anymore.

<div class="figure" style="text-align: center">
<img src="img/plink.png" alt="The PLINK v1.9 website." width="3104" />
<p class="caption">(\#fig:plink)The PLINK v1.9 website.</p>
</div>


**Alternatives to `PLINK`**

Nowadays, a lot of people also use programs like [SNPTEST](snptest){target="_blank"}, [BOLT-LMM](https://data.broadinstitute.org/alkesgroup/BOLT-LMM/){target="_blank"},  [GCTA](http://cnsgenomics.com/software/gcta/#Overview){target="_blank"}, or [regenie](https://rgcgithub.github.io/regenie/){target="_blank"} as alternatives to execute GWAS. These programs were designed with specific use-cases in mind, for instance really large biobank data including hundreds of thousands individuals, better control for population stratification, the ability to estimate trait heritability or Fst, and so on.

**Other programs**

Mendelian randomization can be done either with the [SMR](http://cnsgenomics.com/software/smr/#Overview){target="_blank"} or [GSMR](http://cnsgenomics.com/software/gsmr/){target="_blank"} function from GCTA, or with R-packages, like [`TwoSampleMR`](https://mrcieu.github.io/TwoSampleMR/){target="_blank"}.


## CoCalc

> [ TEXT NEEDS UPDATING]

Now, pay attention. If you came here through the course **Genetic Epidemiology**, you don't have to do anything. All the data you need are already downloaded. 

However, when you are using this book as a standalone, you'll need to start by downloading the data you need for this practical to your Desktop. 

For the course we set up a CoCalc Server and everything should be fine; we installed everything you need. 

## Standalone

So, you plan to use this book as 'Standalone' on a macOS environment. This means you'll need to install a few things first.

### Terminal 

For all the programs we use, except **RStudio**, you will need the **Terminal**. This comes with every major operating system; on Windows it is called 'PowerShell', but let's not go there. And regardless, you will (have to start to) make your own scripts. The benefit of using scripts is that each step in your workflow is clearly stipulated and annotated, and it allows for greater reproducibility, easier troubleshooting, and scaling up to high-performance computer clusters.

Open the **Terminal**, it should be on the left in the toolbar as a little black computer-monitor-like icon. Mac users can type `command + space` and type `terminal`, a **Terminal** screen should open.

> From now on we will use little code blocks like the example to indicate a code you should type/copy-paste and hit enter. If a code is followed by a comment, it is indicated by a # - you don't need to copy-paste and execute this.

```
CODE BLOCK

CODE BLOCK # some comment here
```

### The data you need

You'll need to start by downloading the data you need for this practical to your Desktop. 

Here's the link to the data. 

[Link to Google Drive with data](https://drive.google.com/drive/folders/1iDLB1y534DfgEZNPCYBrIj5X7g_XlBba?usp=share_link)

Make sure you put the data in the `~/Desktop/practical/` folder.

The data are pretty large (approx. 15Gb), so this will take a minute or two depending on your internet connection. Time to stretch your legs or grab a coffee (data scientists don't drink tea). 

### Navigating the Terminal

You can navigate around the computer through the terminal by typing `cd <path>`; `cd` stands for "change directory" and `<path>` means "some_file_directory_you_want_to_go_to".

**For Linux/macOS Users**

_will bring you to your home directory_

```
cd ~ 
```

_will bring you to the parent directory (up one level) _

```
cd ../ 
```

_will bring you to the XXX directory_

```
cd XXX 
```


Let's navigate to the folder you just downloaded.

```
cd ~/Desktop/practical
```


Let's check out what is inside the directory, by listing (`ls`) its contents.

_shows files as list_

```
ls -l 
```

_shows files as list with human readable format _

```
ls -lh 
```
Adding the flags `-lh` will get you the contents of a directory in a list (`-l`) and make the size 'human-readable' (`-h`).

_shows the files as list sorted by time edited_

```
ls -lt 
```

_shows the files as list sorted by size_

```
ls -lS 
```

You can also count the number of files.

```
ls | wc -l
```

And if you want to know all the function of a program simply type the following.

```
man ls
```

This will take you to a manual of the program with an extensive description of each flag (Figure \@ref(fig:ls-manual)).

<div class="figure" style="text-align: center">
<img src="img/ls_manual.png" alt="Partial output from the ls-manual." width="1630" />
<p class="caption">(\#fig:ls-manual)Partial output from the ls-manual.</p>
</div>

### Installing the software

#### brew

Linux has a great package-manager that is lacking on macOS. You can install [`brew`](https://brew.sh){target="_blank"} to compensate for this. This adds the ability to install almost any Linux-based program through the **Terminal** such as `wget`, `llvm`, etc. 

Open **Terminal** and execute the following:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Check if everything is in order.

```
brew doctor
```

It shouldn't report any errors.

#### PLINK

First, we'll get `PLINK`. Navigate to the **PLINK v1.9** website, which can be found [here](https://www.cog-genomics.org/plink2){target="_blank"}. Download the macOS (64-bit) version under 'Stable (beta x.x, day month year)'. 

> Note: Apple produced Intel-based computers for a few years back, and most programs, packages, libraries and whatnot are designed for that. So, I highly recommend using software designed for that and activating Rosetta2 in your Terminal. Don't know how to do that? Following [these instructions](https://support.apple.com/en-us/102527){target="_blank"}.

Unzip the folder and put `plink` in the practical folder. 

```
mv -v ~/Downloads/plink_mac_20231211/plink ~/Desktop/practical/plink 
```

## Installing R and RStudio

Let's go ahead and use `brew` to install the `R` and **RStudio** software.

In **Terminal** execute the following and just follow the instructions.

```
brew install rstudio
brew install --cask r
```

Now close the terminal window - really make sure that the terminal-program has quit.

Open your fresh installation of **RStudio** by double clicking the icon. You should be seeing something like figure \@ref(fig:rstudio-screenshot)

<div class="figure" style="text-align: center">
<img src="img/rstudio-screenshot.png" alt="RStudio screenshot." width="2484" />
<p class="caption">(\#fig:rstudio-screenshot)RStudio screenshot.</p>
</div>


In the top right, you see a little green-white plus-sign, click this and select 'R Notebook' (Figure \@ref(fig:rstudio-screenshot-create-notebook)). 

<div class="figure" style="text-align: center">
<img src="img/rstudio-screenshot-create-notebook.png" alt="RStudio screenshot." width="2484" />
<p class="caption">(\#fig:rstudio-screenshot-create-notebook)RStudio screenshot.</p>
</div>

You will create an untitled (`Untitled1`) `R` notebook: you can combine text descriptions, like you would in a lab-journal, with code-sections. Read what is in the notebook to get a grasp on that (Figure \@ref(fig:rstudio-screenshot-notebook)). 

<div class="figure" style="text-align: center">
<img src="img/rstudio-screenshot-notebook.png" alt="RStudio screenshot." width="2484" />
<p class="caption">(\#fig:rstudio-screenshot-notebook)RStudio screenshot.</p>
</div>

Right, you should be installing some packages. To do so, you can remove `plot(cars)` (or leave and create a new code-block as per instructions in the notebook), and copy paste the code below. Make sure to put in a code block like the example in which `plot(cars)` is in.


```r
remotes::install_github(c("rstudio/rmarkdown"))

install.packages(c("formatR", "remotes", 
                   "httr", "usethis", 
                   "data.table", "devtools", 
                   "dplyr", "tibble", "tidyverse", 
                   "openxlsx",
                   "ggplot2",
                   "ggsci", "ggthemes",
                   "qqman", "CMplot", "plotly", 
                   "openxlsx"))
devtools::install_github("kassambara/ggpubr")

devtools::install_github("oliviasabik/RACER")

remotes::install_github("MRCIEU/TwoSampleMR")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("geneplotter")
```

You should load these packages too. 


```r
library(rmarkdown)
library(formatR)

library(openxlsx)

library(data.table)

library(tibble)
library(tidyverse)
library(dplyr)
library(plotly)

library(ggplot2)
library(devtools)
library(ggpubr)
library(ggsci)
library(ggthemes)

library(qqman)
library(CMplot)
library(RACER)

library(remotes)
library(TwoSampleMR)

library("geneplotter")
```

All in all this may take some time, good moment to relax, review your notes, stretch your legs, or take a coffee.


## Are you ready?

Are you ready? Did you bring coffee and a good dose of energy? Let's start! 

Oh, one more thing: you can save your notebook, the one you just created, to keep all the `R` codes you are applying in the next chapters and add descriptions and notes. If you save this notebook you'll notice that a `html`-file is created. This file is a legible webbrowser-friendly version of your work and contains the codes and the output (code messages, tables, and figures). And the nice thing is, that you can easily share it with others over email. 

Ok. 'Nough said, let's move on to cover some basics in Chapter \@ref(gwas-basics).