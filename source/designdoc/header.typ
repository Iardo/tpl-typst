#let header(
  title: "",
  auth:  "",
  uuid:  "",
  date:  datetime.today(),
  version: none,
  caption: "",
  collaborators: (),
  abstract: [],
  body,
) = {[
  #let collaborators=if type(collaborators) == array {collaborators.join(", ")} else {collaborators}
  #show raw.where(block: true): it => {
    block[
      #h(1fr)
      #box(
        inset: 1em,
        width: 100%-0.5em,
        radius: 0.3em,
        fill: luma(98%),
        stroke: luma(50%),
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
  
  #page(
    align(
      left + horizon,
      block(width: 90%)[
        #let py-xm = v(0.6em, weak: true)
        #let py-sm = v(1.2em, weak: true)
        #let py-md = v(2.0em, weak: true)

        #text(1.2em)[#caption]
        #py-sm
        #text(3em)[*#title*]

        #if version != none {
          py-xm
          rect(fill: black, radius: 0pt, inset: 2pt, outset: 0pt)[
            #text(1em, fill: white)[#version]
          ]
        }

        #if abstract != none {
          py-md
          block(width: 80%)[
            #par(leading: 0.68em, justify: false, linebreaks: "optimized", abstract)
          ]
        }

        #py-md
        #text(1.2em)[#auth]
      ],
    ),
  )

  #body
]}
