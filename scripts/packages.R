################################################################################
#                                PACKAGES TO LOAD                              #
################################################################################

# Bookdown package
# install.packages.auto("bookdown")
library(bookdown)

# TinyTex - needed for LaTeX output (pdf) of book
# https://yihui.org/tinytex/
library(tinytex)
# install.packages.auto('tinytex')
# tinytex::install_tinytex(force = TRUE)

# Open Excel files
library(openxlsx)
# install.packages.auto("openxlsx")


# cat("\n* General packages...\n")
# To get 'data.table' with 'fwrite' to be able to directly write gzipped-files
# Ref: https://stackoverflow.com/questions/42788401/is-possible-to-use-fwrite-from-data-table-with-gzfile
# install.packages("data.table", repos = "https://Rdatatable.gitlab.io/data.table")
# install.packages.auto("data.table")
# library(data.table)
# install.packages.auto("tibble")
# install.packages.auto("tidyverse")
# install.packages.auto("dplyr")
# install.packages.auto("plotly")
#
# # better tables
# # https://davidgohel.github.io/flextable/
# # https://bookdown.org/yihui/rmarkdown-cookbook/table-other.html
# install.packages.auto("flextable")
#
#
# # cat("\n* GGplotting packages - for publication ready plotting...\n")
# install.packages.auto("ggplot2")
# if(!require("devtools"))
#   install.packages.auto("devtools")
# devtools::install_github("kassambara/ggpubr")
# library("ggpubr")
# install.packages.auto("ggsci")
# install.packages.auto("ggthemes")
#
# # cat("\n* Genomic packages...\n")
# install.packages.auto("qqman")
# install.packages.auto("CMplot")
# install_github("oliviasabik/RACER")
#
# install.packages.auto("remotes")
# remotes::install_github("MRCIEU/TwoSampleMR")

# cat("\nTo get National Health and Nutrition Examination Survey (NHANES) data on blood-lipids.\n")
# https://datascienceplus.com/ggplot2-features-for-visualizing-the-nhanes-data/
# https://datascienceplus.com/blood-lipid-levels-accross-age-and-gender-nhanes/
# http://wwww.silentspring.org/RNHANES/index.html
# devtools::install_github("silentspringinstitute/RNHANES")
# library("RNHANES")

# install.packages.auto("readr")
# install.packages.auto("optparse")
# install.packages.auto("tools")
# install.packages.auto("dplyr")
# install.packages.auto("tidyr")
# install.packages.auto("naniar")
#
#
# install.packages.auto("tidyverse")
# install.packages.auto("knitr")
# install.packages.auto("DT")
# install.packages.auto("eeptools")
#
# # Install the devtools package from Hadley Wickham
# install.packages.auto('devtools')
#
# install.packages.auto("org.Hs.eg.db")
# install.packages.auto("mygene")
# install.packages.auto("EnhancedVolcano")
#
# install.packages.auto("haven")
# install.packages.auto("tableone")
#

# install.packages.auto("TxDb.Hsapiens.UCSC.hg19.knownGene")
# install.packages.auto("org.Hs.eg.db")
# install.packages.auto("AnnotationDbi")
# install.packages.auto("EnsDb.Hsapiens.v86")
#
# # for plotting
# install.packages.auto("pheatmap")
# install.packages.auto("forestplot")
# # for meta-analysis
# install.packages.auto("meta")
# install.packages.auto("bacon")
