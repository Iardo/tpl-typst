#import "../../../vendor/gui-typst/source/designdoc/0.1.0/bibliography.typ": references

// Definition
#let bib_hide = false
#let bib_data = "/source/designdoc/include/11-bibliography.yml"

#show: references.with(
  hide: bib_hide,
  data: bib_data,
)
