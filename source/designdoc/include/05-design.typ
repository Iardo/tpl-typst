#import "../../../vendor/gui-typst/source/designdoc/0.1.0/@global.typ": *
#import "../../../vendor/gui-typst/source/designdoc/0.1.0/separator.typ": separator_with_title

#heading(level: 1)[#box[
  Diseño
]]


#heading(level: 2)[#box[
  Base de Datos
]]


#heading(level: 3)[#box[
  Diagramas
]]
// #figure(
//   image("/static/image/designdoc/<name>-database.svg", width: 100%),
//   caption: [Diagrama Entidad-Relación],
//   kind: image,
// )


#pagebreak()
#heading(level: 3)[#box[
  Descripción de las tablas
]]
#let table_cell_x0_text = (font: font-mono, size: textsize-table, weight: 400)
#figure(caption: [Tabla User], kind: table)[
  #show table.cell.where(x: 0): set text(..table_cell_x0_text)
  #table(
    columns: (20%, 1fr),
    align: (left + top, left + top),
    inset: 5pt,
    table-header(
      table.cell(colspan: 2, align: center)[user],
    ),
      [],                 [],
  )
]


#pagebreak()
#heading(level: 2)[#box[
  Interfaz Gráfica
]]

