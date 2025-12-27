#import "../../../vendor/gui-typst/source/designdoc/0.1.0/table-of-figures.typ": table-of-figures

// Definition
#let tof_hide = false

#show: table-of-figures.with( 
  hide: tof_hide,
)
