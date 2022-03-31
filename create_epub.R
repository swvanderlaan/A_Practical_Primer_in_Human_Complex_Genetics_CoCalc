epub_book(fig_width = 5, fig_height = 4, dev = "png",
          fig_caption = TRUE, number_sections = TRUE, toc = FALSE,
          toc_depth = 3, stylesheet = NULL, cover_image = NULL,
          metadata = NULL, chapter_level = 1,
          epub_version = c("epub3", "epub", "epub2"),
          md_extensions = NULL, global_numbering = !number_sections,
          pandoc_args = NULL, template = "default")

bookdown::epub_book:
  fig_width: 5
fig_height: 4
dev: "png"
fig_caption: true
number_sections: true
toc: false
toc_depth: 3
cover_image: "img/banner_man_standing_dna.png"
metadata: "Copyright 2022. Sander W. van der Laan"
chapter_level: 1
epub_version: "epub"
template: "default"
