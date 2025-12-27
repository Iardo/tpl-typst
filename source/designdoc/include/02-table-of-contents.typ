#import "../../../vendor/gui-typst/source/designdoc/0.1.0/table-of-contents.typ": table-of-contents

// Definition
#let toc_hide = false

#show: table-of-contents.with(
  hide: toc_hide,
)
