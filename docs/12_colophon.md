# Colophon





The 2022 and 2024 editions of this book were produce in RStudio and with the `bookdown` package. Below a listing of installed programs and libraries, the operating system, and their specific versions.


```r
sessioninfo::session_info()
```

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value
##  version  R version 4.3.3 (2024-02-29)
##  os       macOS Sonoma 14.5
##  system   x86_64, darwin20
##  ui       X11
##  language (EN)
##  collate  en_US.UTF-8
##  ctype    en_US.UTF-8
##  tz       America/New_York
##  date     2024-04-09
##  pandoc   3.1.1 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/ (via rmarkdown)
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package           * version     date (UTC) lib source
##  abind               1.4-5       2016-07-21 [2] CRAN (R 4.3.0)
##  annotate          * 1.80.0      2023-10-24 [2] Bioconductor
##  AnnotationDbi     * 1.64.1      2023-11-03 [2] Bioconductor
##  askpass             1.2.0       2023-09-03 [2] CRAN (R 4.3.0)
##  backports           1.4.1       2021-12-13 [2] CRAN (R 4.3.0)
##  Biobase           * 2.62.0      2023-10-24 [2] Bioconductor
##  BiocGenerics      * 0.48.1      2023-11-01 [2] Bioconductor
##  Biostrings          2.70.3      2024-03-13 [2] Bioconductor 3.18 (R 4.3.3)
##  bit                 4.0.5       2022-11-15 [2] CRAN (R 4.3.0)
##  bit64               4.0.5       2020-08-30 [2] CRAN (R 4.3.0)
##  bitops              1.0-7       2021-04-24 [2] CRAN (R 4.3.0)
##  blob                1.2.4       2023-03-17 [2] CRAN (R 4.3.0)
##  bookdown          * 0.38.1      2024-03-26 [2] Github (rstudio/bookdown@50a1c1e)
##  broom               1.0.5       2023-06-09 [2] CRAN (R 4.3.0)
##  bslib               0.6.2       2024-03-22 [2] CRAN (R 4.3.2)
##  cachem              1.0.8       2023-05-01 [2] CRAN (R 4.3.0)
##  calibrate           1.7.7       2020-06-19 [2] CRAN (R 4.3.0)
##  car                 3.1-2       2023-03-30 [2] CRAN (R 4.3.0)
##  carData             3.0-5       2022-01-06 [2] CRAN (R 4.3.0)
##  chromote            0.2.0       2024-02-12 [1] CRAN (R 4.3.2)
##  cli                 3.6.2       2023-12-11 [2] CRAN (R 4.3.0)
##  CMplot            * 4.5.1       2024-01-19 [2] CRAN (R 4.3.0)
##  colorspace          2.1-0       2023-01-23 [2] CRAN (R 4.3.0)
##  crayon              1.5.2       2022-09-29 [2] CRAN (R 4.3.0)
##  crul                1.4.0       2023-05-17 [2] CRAN (R 4.3.0)
##  curl                5.2.1       2024-03-01 [2] CRAN (R 4.3.2)
##  data.table        * 1.15.4      2024-03-30 [1] CRAN (R 4.3.2)
##  DBI                 1.2.2       2024-02-16 [2] CRAN (R 4.3.2)
##  devtools          * 2.4.5       2022-10-11 [2] CRAN (R 4.3.0)
##  digest              0.6.35      2024-03-11 [2] CRAN (R 4.3.2)
##  dplyr             * 1.1.4       2023-11-17 [2] CRAN (R 4.3.0)
##  DT                * 0.33        2024-04-04 [1] CRAN (R 4.3.2)
##  ellipsis            0.3.2       2021-04-29 [2] CRAN (R 4.3.0)
##  evaluate            0.23        2023-11-01 [2] CRAN (R 4.3.0)
##  fansi               1.0.6       2023-12-08 [2] CRAN (R 4.3.0)
##  fastmap             1.1.1       2023-02-24 [2] CRAN (R 4.3.0)
##  flextable         * 0.9.5       2024-03-06 [1] CRAN (R 4.3.2)
##  fontBitstreamVera   0.1.1       2017-02-01 [2] CRAN (R 4.3.0)
##  fontLiberation      0.1.0       2016-10-15 [2] CRAN (R 4.3.0)
##  fontquiver          0.2.1       2017-02-01 [2] CRAN (R 4.3.0)
##  forcats           * 1.0.0       2023-01-29 [2] CRAN (R 4.3.0)
##  foreign             0.8-86      2023-11-28 [2] CRAN (R 4.3.3)
##  formatR           * 1.14        2023-01-17 [2] CRAN (R 4.3.0)
##  fs                  1.6.3       2023-07-20 [2] CRAN (R 4.3.0)
##  gdtools             0.3.7       2024-03-05 [2] CRAN (R 4.3.2)
##  geneplotter       * 1.80.0      2023-10-24 [2] Bioconductor
##  generics            0.1.3       2022-07-05 [2] CRAN (R 4.3.0)
##  GenomeInfoDb        1.38.8      2024-03-15 [2] Bioconductor 3.18 (R 4.3.3)
##  GenomeInfoDbData    1.2.11      2024-03-26 [2] Bioconductor
##  gfonts              0.2.0       2023-01-08 [2] CRAN (R 4.3.0)
##  ggplot2           * 3.5.0       2024-02-23 [2] CRAN (R 4.3.2)
##  ggpubr            * 0.6.0.999   2024-03-26 [2] Github (kassambara/ggpubr@6aeb4f7)
##  ggsci             * 3.0.3       2024-03-25 [2] CRAN (R 4.3.2)
##  ggsignif            0.6.4       2022-10-13 [2] CRAN (R 4.3.0)
##  ggthemes          * 5.1.0       2024-02-10 [2] CRAN (R 4.3.2)
##  glue                1.7.0       2024-01-09 [2] CRAN (R 4.3.0)
##  gtable              0.3.4       2023-08-21 [2] CRAN (R 4.3.0)
##  hms                 1.1.3       2023-03-21 [2] CRAN (R 4.3.0)
##  htmltools           0.5.8       2024-03-25 [2] CRAN (R 4.3.2)
##  htmlwidgets         1.6.4       2023-12-06 [2] CRAN (R 4.3.0)
##  httpcode            0.3.0       2020-04-10 [2] CRAN (R 4.3.0)
##  httpuv              1.6.15      2024-03-26 [2] CRAN (R 4.3.2)
##  httr                1.4.7       2023-08-15 [2] CRAN (R 4.3.0)
##  ieugwasr          * 0.2.2-9000  2024-04-05 [1] Github (MRCIEU/ieugwasr@52e03a7)
##  IRanges           * 2.36.0      2023-10-24 [2] Bioconductor
##  jquerylib           0.1.4       2021-04-26 [2] CRAN (R 4.3.0)
##  jsonlite            1.8.8       2023-12-04 [2] CRAN (R 4.3.0)
##  kableExtra        * 1.4.0       2024-01-24 [1] CRAN (R 4.3.2)
##  KEGGREST            1.42.0      2023-10-24 [2] Bioconductor
##  knitr             * 1.45        2023-10-30 [1] CRAN (R 4.3.0)
##  later               1.3.2       2023-12-06 [2] CRAN (R 4.3.0)
##  lattice           * 0.22-6      2024-03-20 [2] CRAN (R 4.3.2)
##  lazyeval            0.2.2       2019-03-15 [2] CRAN (R 4.3.0)
##  lifecycle           1.0.4       2023-11-07 [2] CRAN (R 4.3.0)
##  lubridate         * 1.9.3       2023-09-27 [2] CRAN (R 4.3.0)
##  magrittr            2.0.3       2022-03-30 [2] CRAN (R 4.3.0)
##  MASS                7.3-60.0.1  2024-01-13 [2] CRAN (R 4.3.3)
##  Matrix              1.6-5       2024-01-11 [2] CRAN (R 4.3.3)
##  memoise             2.0.1       2021-11-26 [2] CRAN (R 4.3.0)
##  mime                0.12        2021-09-28 [2] CRAN (R 4.3.0)
##  miniUI              0.1.1.1     2018-05-18 [2] CRAN (R 4.3.0)
##  mitools             2.4         2019-04-26 [1] CRAN (R 4.3.0)
##  MRInstruments     * 0.3.2       2024-03-27 [1] Github (MRCIEU/MRInstruments@efa2ca0)
##  munsell             0.5.1       2024-04-01 [1] CRAN (R 4.3.2)
##  officer             0.6.5       2024-02-24 [2] CRAN (R 4.3.2)
##  openssl             2.1.1       2023-09-25 [2] CRAN (R 4.3.0)
##  openxlsx          * 4.2.5.2     2023-02-06 [2] CRAN (R 4.3.0)
##  pillar              1.9.0       2023-03-22 [2] CRAN (R 4.3.0)
##  pkgbuild            1.4.4       2024-03-17 [2] CRAN (R 4.3.2)
##  pkgconfig           2.0.3       2019-09-22 [2] CRAN (R 4.3.0)
##  pkgload             1.3.4       2024-01-16 [2] CRAN (R 4.3.0)
##  plotly            * 4.10.4      2024-01-13 [2] CRAN (R 4.3.0)
##  png                 0.1-8       2022-11-29 [2] CRAN (R 4.3.0)
##  processx            3.8.4       2024-03-16 [2] CRAN (R 4.3.2)
##  profvis             0.3.8       2023-05-02 [2] CRAN (R 4.3.0)
##  promises            1.2.1       2023-08-10 [2] CRAN (R 4.3.0)
##  ps                  1.7.6       2024-01-18 [2] CRAN (R 4.3.0)
##  purrr             * 1.0.2       2023-08-10 [2] CRAN (R 4.3.0)
##  qqman             * 0.1.9       2023-08-23 [2] CRAN (R 4.3.0)
##  R6                  2.5.1       2021-08-19 [2] CRAN (R 4.3.0)
##  RACER             * 1.0.0       2024-03-26 [2] Github (oliviasabik/RACER@1394c9d)
##  ragg                1.3.0       2024-03-13 [2] CRAN (R 4.3.2)
##  RColorBrewer        1.1-3       2022-04-03 [2] CRAN (R 4.3.0)
##  Rcpp                1.0.12      2024-01-09 [2] CRAN (R 4.3.0)
##  RCurl               1.98-1.14   2024-01-09 [2] CRAN (R 4.3.0)
##  readr             * 2.1.5       2024-01-10 [2] CRAN (R 4.3.0)
##  remotes           * 2.5.0       2024-03-17 [2] CRAN (R 4.3.2)
##  rlang               1.1.3       2024-01-10 [2] CRAN (R 4.3.0)
##  rmarkdown         * 2.26.1      2024-03-26 [2] Github (rstudio/rmarkdown@ee69d59)
##  RNHANES           * 1.1.1       2024-03-27 [1] Github (silentspringinstitute/RNHANES@860fc94)
##  RSQLite             2.3.5       2024-01-21 [2] CRAN (R 4.3.0)
##  rstatix             0.7.2       2023-02-01 [2] CRAN (R 4.3.0)
##  rstudioapi          0.16.0      2024-03-24 [2] CRAN (R 4.3.2)
##  rvest               1.0.4       2024-02-12 [2] CRAN (R 4.3.2)
##  S4Vectors         * 0.40.2      2023-11-23 [2] Bioconductor
##  sass                0.4.9       2024-03-15 [2] CRAN (R 4.3.2)
##  scales              1.3.0       2023-11-28 [2] CRAN (R 4.3.0)
##  sessioninfo         1.2.2       2021-12-06 [2] CRAN (R 4.3.0)
##  shiny               1.8.1       2024-03-26 [2] CRAN (R 4.3.2)
##  stringi             1.8.3       2023-12-11 [2] CRAN (R 4.3.0)
##  stringr           * 1.5.1       2023-11-14 [2] CRAN (R 4.3.0)
##  survey              4.4-2       2024-03-20 [1] CRAN (R 4.3.2)
##  survival            3.5-8       2024-02-14 [2] CRAN (R 4.3.3)
##  svglite             2.1.3       2023-12-08 [1] CRAN (R 4.3.0)
##  systemfonts         1.0.6       2024-03-07 [2] CRAN (R 4.3.2)
##  textshaping         0.3.7       2023-10-09 [2] CRAN (R 4.3.0)
##  tibble            * 3.2.1       2023-03-20 [2] CRAN (R 4.3.0)
##  tidyr             * 1.3.1       2024-01-24 [2] CRAN (R 4.3.2)
##  tidyselect          1.2.1       2024-03-11 [2] CRAN (R 4.3.2)
##  tidyverse         * 2.0.0       2023-02-22 [2] CRAN (R 4.3.0)
##  timechange          0.3.0       2024-01-18 [2] CRAN (R 4.3.0)
##  tinytex           * 0.50        2024-03-16 [2] CRAN (R 4.3.2)
##  TwoSampleMR       * 0.5.11      2024-03-26 [2] Github (MRCIEU/TwoSampleMR@ebfeb95)
##  tzdb                0.4.0       2023-05-12 [2] CRAN (R 4.3.0)
##  urlchecker          1.0.1       2021-11-30 [2] CRAN (R 4.3.0)
##  usethis           * 2.2.3       2024-02-19 [2] CRAN (R 4.3.2)
##  utf8                1.2.4       2023-10-22 [2] CRAN (R 4.3.0)
##  uuid                1.2-0       2024-01-14 [2] CRAN (R 4.3.0)
##  vctrs               0.6.5       2023-12-01 [2] CRAN (R 4.3.0)
##  viridisLite         0.4.2       2023-05-02 [2] CRAN (R 4.3.0)
##  webshot           * 0.5.5       2023-06-26 [1] CRAN (R 4.3.0)
##  webshot2          * 0.1.1       2023-08-11 [1] CRAN (R 4.3.0)
##  websocket           1.4.1       2021-08-18 [1] CRAN (R 4.3.0)
##  withr               3.0.0       2024-01-16 [2] CRAN (R 4.3.0)
##  xfun                0.43        2024-03-25 [2] CRAN (R 4.3.2)
##  XML               * 3.99-0.16.1 2024-01-22 [2] CRAN (R 4.3.2)
##  xml2              * 1.3.6       2023-12-04 [2] CRAN (R 4.3.0)
##  xtable              1.8-4       2019-04-21 [2] CRAN (R 4.3.0)
##  XVector             0.42.0      2023-10-24 [2] Bioconductor
##  yaml                2.3.8       2023-12-11 [2] CRAN (R 4.3.0)
##  zip                 2.3.1       2024-01-27 [2] CRAN (R 4.3.2)
##  zlibbioc            1.48.2      2024-03-13 [2] Bioconductor 3.18 (R 4.3.3)
## 
##  [1] /Users/slaan3/Library/R/x86_64/4.3/library
##  [2] /Library/Frameworks/R.framework/Versions/4.3-x86_64/Resources/library
## 
## ──────────────────────────────────────────────────────────────────────────────
```

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/banner_man_standing_dna.png" alt="Colofon">' + title.innerHTML
</script>

<!-- example: https://yearbookdiscoveries.com/wp-content/uploads/2014/05/Writing_a_Yearbook_Colophon.pdf -->
<!-- SPECIAL THANKS: (The staff wrote a few paragraphs about the year and mentioned a variety -->
<!-- of people who were instrumental in the success of their yearbook.) -->
<!-- COVER & ENDSHEETS: The 2013 Pinnacle cover is a four-color lithograph. An iridescent foil -->
<!-- covers a portion of the theme design. The endsheets are standard stock paper. The theme -->
<!-- concept was created and expanded by the editorial team and members of the 2013 Pinnacle -->
<!-- staff. Cover and endsheets were designed by Pinnacle co-editors-in-chief Regan Brown and -->
<!-- Ellena Sullivan, with inspiration provided by an early design from co-reference editor -->
<!-- Amanda Farrer. -->
<!-- TYPE & COLOR TREATMENT: Body copy throughout the book is set in Frutiger Light -->
<!-- Condensed (8.5 pt.) Captions are set in Frutiger Light Condensed (7.5 pt.) Headline -->
<!-- treatments are designed with variations of AHJ Nashville, Arno Pro and Frutiger. Photo -->
<!-- credits and spread credits appear in Frutiger Italic (6 pt.) -->
<!-- For consistency, a color palette was chosen. In addition to the traditional black, the -->
<!-- following colors appear throughout the publication: Pantone 151C, Pantone 3005C, Panton -->
<!-- 2985C, Pantone 115C, Pantone 376C, Pantone 363C, Pantone 266C, Pantone 185C and -->
<!-- Pantone Cool Grey 7C. -->
<!-- PUBLISHING: Volume 107 of the Pinnacle was designed and produced by the 2013 Pinnacle -->
<!-- staff. The 456-page, all-color Pinnacle is printed on 80 lb. gloss paper by Herff Jones -->
<!-- Publishing Co. in Kansas City, MO. Approximately 3,000 copies were pre-ordered for $52. -->
<!-- Any extra copies were sold for $60. A 48-page supplement was included in this price. The -->
<!-- publication was created using Adobe CS5.5 software on 42 Macintosh desktop and laptop -->
<!-- computers. -->
<!-- PHOTOGRAPHY: Pinnacle staff photographers shot digital photos using four Nikon D70s, -->
<!-- two Nikon D80s and one Nikon D40. Sport group photos were shot by Prestige Portraits, -->
<!-- and club and group photos were shot by both Prestige Portraits and Pinnacle yearbook staff -->
<!-- photographers. Some submitted photos appear throughout the book as well. -->
<!-- EDITORS’ NOTE: (A special note from the co-editors-in-chief was included here. The yearbook -->
<!-- staff photo with names and staff positions was included on the spread with the colophon.) -->
