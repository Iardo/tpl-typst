#import "../../../vendor/gui-typst/source/designdoc/0.1.0/@global.typ": *

#pagebreak()
#heading(level: 1)[#box[
  Glosario
]]


#block()[
  #show table: set text(size: (textsize-outline - 0.2em))
  #show table.cell.where(x: 1): set text(weight: 600)
  #table(
    columns: (auto, auto, 1fr),
    align: (left + top, left + top, left + top),
    inset: 5pt,
    stroke: none,
    [1.], [], [],
  )
]
