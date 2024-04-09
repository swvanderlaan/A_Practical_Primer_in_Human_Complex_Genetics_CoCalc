# A Practical Primer in Human Complex Genetics

_A Practical Primer in Human Complex Genetics_ was originally written for the the **Genetic Epidemiology** course organized by the [Master Epidemiology](https://epidemiology-education.nl) of Utrecht University, but can be used as a practical guide and companion to learning and doing a genome-wide association study (GWAS).

It is available as [GitBook](https://swvanderlaan.github.io//A_Practical_Primer_in_Human_Complex_Genetics/) and HTML. A PDF and EPUB version is forthcoming.

This book was made possible by the kind help of Caspar J. van Lissa who wrote an excellent instruction through an example GitBook https://cjvanlissa.github.io/gitbook-demo/.

#### Changes log
    
    _Version:_      v2.2.2</br>
    _Last update:_  2024-04-08</br>
    _Written by:_   Sander W. van der Laan (s.w.vanderlaan-2[at]umcutrecht.nl).
    
    **MoSCoW To-Do List**
    The things we Must, Should, Could, and Would have given the time we have.
    _M_
    
    - [x] `M` create a separate CoCalc version
    - [x] `M` add in full installation instructions for UBUNTU > DROPPED
    - [x] `M` add in full installation instructions for macOS
    - [x] `M` create chapter on CoCalc
    - [x] `M` redesign 'Getting Started' chapter
    - [x] `M` add proper team-page
    - [x] `M` fix regional association plotting
    - [x] `M` fix issue with api of Two Sample MR > run the codes.
    - [x] `M` fix issue with `api of Two Sample MR`cat: /Users/USERNAME/Desktop/practical/gwas/data.assoc.logistic.clumped: No such file or     directory` - this was not run yet
    - [x] `M` fix images per header in GitBook (not showing)
    - [] `M` conditional analysis
    - [] `M` statistical finemapping
    - [] `M` colocalization with formal testing
    - [] `M` MRbase tutorial
    - [] `M` Add partial recreation of the Cystatin C MR study
    - [x] `M` overall rendering too slow, paste in images as figure instead of on the fly generating
    - [] `M` fix issue with PDF creation
    - [] `M` fix issue with EPUB creation
    - [] `M` fix issue with EPUB creation and images
    - [] `M` get ISBN number
    - [] `M` Upgrade to Quatro - seems to work better in many respects; also adds interactivity https://quarto.org/docs/books/. This will probably fix the PDF and EPUB creation issues, as well as the image display issues.
     
    _S_
    - [] `S` meta-analysis with dummy data
        - `S` HPC version with MetaGWASToolKit
        - `S` including stratified QQ plots
        - `S` stand-alone version with METAL
    - [] `S` add online imputation chapter
        - [] `S` fix images per header in EPUB
    - [] `S` PDF is not formatted properly (text runs over)
    - [] `S` EPUB is not formatted properly (text runs over)
    - [] `S` different setup for the chapter Additional chapters (this as a Apendix)
    - [x] `S` fix the way the team is displayed
    - [] `S` fix book cover > version 2024 'quick and dirty'
      - https://www.designhill.com/design-blog/the-perfect-ebook-cover-size-guide-and-publishing-tips/
      - https://snappa.com/blog/ebook-cover-size/
      - https://kdp.amazon.com/en_US/help/topic/G200645690.
    - [] `S` add in chapter on liftOver
    
    _C_
    - [] `C` GWASToolKit
    - [] `C` PlaqView lookups
    - [] `C` Different font type in PDF
    
    _W_
    - [] `W` add in full installation instructions for Windows
    - [x] `W` add favicon and Apple-touch-icon
      - https://iconifier.net

    **Changes log**
    * v2.2.2 Small fix to remove `knitr` codes. Fixed errors in `opts$chunks` for `knitr` and `rmarkdown` regarding 'echo'.
    * v2.2.1 Small fixes to references. Added book cover. Added favicon and Apple-touch-icon.
    * v2.2.0 Created a full CoCalc version, and a separate Standalone version.
    * v2.1.2 Small fix to directory reference.
    * v2.1.1 Finalized CoCalc instructions. Added Team chapter. Fixed issue with Two-Sample MR. Fixed issue with regional association plotting. Checked Questions and Answers. Edited the To-Do list
    * v2.1.0 Added CoCalc instructions. Added Standalone instructions. Added chapter on used-programs. Re-organized 'Getting Started' chapter. Updated To-Do list in readme.
    * v2.0.6 Fixes to the visualization chapter where data was not properly loaded. Fix to the references in the WTCCC1 chapter where they were not properly generated.
    * v2.0.5 Added all header-images. Fixed references to tables and figures.
    * v2.0.4 Added WTCCC1 introduction; added WTCCC1 analyses and visualization. Add post-GWAs chapter.
    * v2.0.3 Added GWAS visualization.
    * v2.0.2 Added GWAS testing. Updates to saving of plots. Re-organization of data.
    * v2.0.1 Fixed standalone instructions. Fixed dummy GWAS project.
    * v1.0.0 Initial version. 

--------------
------
<sup>Copyright 1979-2024. All rights reserved. Sander W. van der Laan | s.w.vanderlaan [at] gmail.com | [https://vanderlaanand.science](https://vanderlaanand.science){target="_blank"}. Published with [`bookdown`](https://bookdown.org/yihui/bookdown/){target="_blank"}.</sup>
