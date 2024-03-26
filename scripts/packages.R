################################################################################
#                                PACKAGES TO LOAD                              #
################################################################################

cat("\nPackages to install for this book and its contents to automagically work.\n")

cat("\n* Bookdown and rmarkdown packages...\n")
# Bookdown package
# there is an issue with \@ref(some_chapter) reported here:https://github.com/rstudio/bookdown/issues/832
# you may need to reinstall rmarkdown and bookdown which should fix this.
# install.packages("remotes")
# remotes::install_github(c('rstudio/rmarkdown', 'rstudio/bookdown'))
library(rmarkdown)
library(bookdown)

# for publishing in proper layout the r-codes
# https://blog.datascienceheroes.com/how-to-self-publish-a-book-customizing-bookdown/
# https://yihui.shinyapps.io/formatR/
# install.packages("formatR")
library(formatR)

# TinyTex - needed for LaTeX output (pdf) of book
# https://yihui.org/tinytex/
# https://github.com/yihui/formatR
# tinytex::install_tinytex(force = TRUE)
library(tinytex)

# Open Excel files
# install.packages("openxlsx")
library(openxlsx)

cat("\n* General packages...\n")
# To get 'data.table' with 'fwrite' to be able to directly write gzipped-files
# Ref: https://stackoverflow.com/questions/42788401/is-possible-to-use-fwrite-from-data-table-with-gzfile
# install.packages("data.table")
library(data.table)

# install.packages("tibble")
# install.packages("tidyverse")
# install.packages("dplyr")
# install.packages("plotly")
library(tibble)
library(tidyverse)
library(dplyr)
library(plotly)

# Present better tables
# https://davidgohel.github.io/flextable/
# https://bookdown.org/yihui/rmarkdown-cookbook/table-other.html
# install.packages("xml2")
library(xml2)
# install.packages("flextable")
library(flextable)

cat("\n* GGplotting packages - for publication ready plotting...\n")
# install.packages("ggplot2")
library(ggplot2)
# if(!require("devtools"))
#   install.packages("devtools")
library(devtools)
# devtools::install_github("kassambara/ggpubr")
library(ggpubr)
# install.packages("ggsci")
# install.packages("ggthemes")
library(ggsci)
library(ggthemes)

cat("\n* Genomic packages...\n")
# install.packages("qqman")
# install.packages("CMplot")
# install_github("oliviasabik/RACER")
library(qqman)
library(CMplot)
library(RACER)

library(remotes)
# remotes::install_github("MRCIEU/TwoSampleMR")
library(TwoSampleMR)

# install geneplotter for pretty plotting of genetic data
# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("geneplotter")

library("geneplotter")
