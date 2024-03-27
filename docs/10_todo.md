# Things to do {#todo}
![](./img/_headers/banner_man_standing_dna.png){width=100%}

I provide a list of things to do, to improve, to alter, to edit or to add. Crazy ideas. Useful tips, tricks, or links. 

Obviously this list is not exhaustive nor intended for practical use for anyone else but me.

## MoSCoW

List of to-do's according to MoSCoW: _must have_, _should have_, _could have_, _would have_.

### Contents

- [x] `M` add in full installation instructions for UBUNTU > DROPPED
- [] `M` add in full installation instructions for macOS
- [] `M` conditional analysis
- [] `M` statistical finemapping
- [x] `M` regional association plotting
- [] `M` colocalization with formal testing
- [] `S` meta-analysis with dummy data
    - `S` including stratified QQ plots
    - `M` HPC version with MetaGWASToolKit
    - `S` stand-alone version with METAL
- [] `C` GWASToolKit
- [] `C` PlaqView lookups

## Book fixes

- [x] `M` overall rendering too slow, paste in images as figure instead of on the fly generating
- [x] `M` PDF is too large
- [] `M` fix images per header in EPUB
- [] `M` fix images per header in GitBook (not showing)
- [] `S` PDF is not formatted properly (text runs over)
- [] `C` Different font type in PDF
- [] `S` EPUB is not formatted properly (text runs over)
- [] `S` different setup for the chapter Additional chapters (this as a Apendix)
- [x] `S` fix the way the team is displayed
- [] `S` fix book cover
  - https://www.designhill.com/design-blog/the-perfect-ebook-cover-size-guide-and-publishing-tips/
  - https://snappa.com/blog/ebook-cover-size/
  - https://kdp.amazon.com/en_US/help/topic/G200645690.

## Useful links (for me mostly)

https://bookdown.org/yihui/rmarkdown-cookbook/unnumbered-sections.html

https://bookdown.org/yihui/bookdown/cross-references.html

https://pandoc.org/MANUAL.html#extension-header_attributes

Add an image above the title:

- https://stackoverflow.com/questions/62074546/add-image-before-bookdown-title

But it causes an issue, described [here](https://www.mobileread.com/forums/showthread.php?t=206086). So you better remove this chunk of code:


```
\```{js, echo = FALSE}
title=document.getElementById('header');
title.innerHTML = '<img src="img/_headers/banner_man_standing_dna.png" alt="A Practical Primer in Human Complex Genetics">' + title.innerHTML
\```
```

