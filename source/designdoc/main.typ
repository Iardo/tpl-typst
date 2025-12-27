#import "./include/00-metadata.typ": *
#import "../../vendor/gui-typst/source/designdoc/0.1.0/@global.typ": *
#import "../../vendor/gui-typst/source/designdoc/0.1.0/footer.typ": footer_el
#import "../../vendor/gui-typst/source/designdoc/0.1.0/header.typ": header_el

// Config
// ---------------
// Block
// ----
#set block(spacing: space-leading)

// Document
// ----
#set document(
  title: [#title],
  author: auth,
  date: datetime.today(),
)

// Heading
// ----
#set heading(numbering: number-heading)
#show heading: it => {
  let prefix = ""
  set text(font: font-heading)
  if it.numbering != none {
    if counter(heading).get().at(0) > 0 and it.level == 1 {
      prefix = counter(heading).display()
      prefix += ". "
    }
  }
  block(below: space-heading)[
    #text()[#prefix#it.body]
    #linebreak()
  ]
}

// Figure
// ----
#show figure: set figure.caption(position: top)
#show figure: it => block()[
  #set align(left)
  #if       it.kind == table {
    [Tabla]
  } else if it.kind == image {
    [Figura]
  } else {
    it.supplement
  }
  #it.counter.display(it.numbering):
  #it.caption.body
  #it.body
]

// Link
// ----
#show link: it => {
  text(font: font-sans, size: textsize-link, weight: 500, fill: color-link)[#box[
    #underline()[#it]
  ]]
}

// List
// ----
#set list(marker: marker-list)

// Outline
// ----
#show outline: set text(size: textsize-outline)
#show outline: set underline(stroke: 0pt)
#show outline.entry: it => {
  let prefix = it.prefix()
  let separator
  if it.element.func() != figure {
    separator = " - "
  } else {
    if        it.element.kind == image {
      prefix    = "Figura"
      separator = ": "
    } else if it.element.kind == table {
      prefix    = "Tabla"
      separator = ": "
    }
  }
  block(below: space-list)[
    #link(it.element.location())[
      #text(font: font-serif, fill: black, weight: 400)[#it.indented(none, prefix + separator + it.inner())]
    ]
  ]
}

// Page
// ----
#set page(
  numbering: number-page,
  margin: (x: 2cm, y: 2.5cm),
  header: context {
    if counter(page).get().first() > 1 [
      #show: header_el.with(
        title: title,
        version: version,
      )
    ]
  },
  footer: context {
    show: footer_el.with()
  }
)

// Paragraph
// ----
#set par(leading: space-leading, justify: false, linebreaks: "optimized")

// Table
// ----
#show table: set text(font: font-link, size: textsize-table, weight: 300)
#show table: set underline(stroke: 0pt)
#set table(
  inset: 5pt,
  stroke: (x, y) => {
    if y != 0 { (bottom: strokesize-table) } else { (top:  strokesize-table, bottom: 1pt) }
    if x  > 0 { (left:   strokesize-table) }
  },
)

// Text
// ----
#set text(font: font-serif, size: textsize-paragraph, fallback: false)

// Text Raw
// ----
#set raw(theme: "/static/theme/eiffel.tmtheme")
#show raw.where(block: true): set text(1em / 0.8)
#show raw: set text(font: font-mono, weight: 700, ligatures: true, fallback: false)
#show raw: it => {
  if it.block == false {
    it
  } else {
    block(inset: (y: space-heading))[
      #let stroke  = none
      #let inset   = 0.0pt
      #let outline = false // Toggle
      #if  outline { 
        inset  = space-xs
        stroke = (dash: "dotted", thickness: 1pt, paint: black)
      }
      #rect(inset: inset, stroke: stroke)[
        #text()[#it]
      ]
    ]
  }
}


// Content
// ---------------
#include "./include/00-metadata.typ"
#include "./include/01-title.typ"
// #include "./include/02-table-of-contents.typ"
#init_page_numbering()
// #include "./include/03-introduction.typ"
// #include "./include/04-architecture.typ"
// #include "./include/05-design.typ"
// #include "./include/06-dependencies.typ"
// #include "./include/07-appendix.typ"
// #include "./include/08-glossary.typ"
// #include "./include/09-table-of-figures.typ"
// #include "./include/10-table-of-tables.typ"
// #include "./include/11-bibliography.typ"
