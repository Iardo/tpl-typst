#let header(
  title: "",
  caption: "",
  date: datetime.today(),
  collaborators: (),
  doc,
) = {[
  #let collaborators=if type(collaborators) == array {collaborators.join(", ")} else {collaborators}
  #show raw.where(block: true): it => {
    block[
      #h(1fr)
      #box(
        width: 100%-0.5em,
        radius: 0.3em,
        stroke: luma(50%),
        inset: 1em,
        fill: luma(98%)
      )[
        #show raw.line: l => context {
          box(width:measure([#it.lines.last().count]).width, align(right, text(fill: luma(50%))[#l.number]))
          h(0.5em)
          l.body
        }
        #it
      ]
    ]
  }
  
  #align(center, {
    text(size: 1.6em, weight: "bold")[#title \ ]
    text(size: 1.2em, weight: "regular")[-- #caption -- \ ]
    emph[
      #date.display("[year]-[month]-[day]") 
      #if collaborators != none {[
        \ Colaboradores: #collaborators
      ]}
    ]
    box(line(length: 100%, stroke: 1pt))
  })

  #doc
]}
