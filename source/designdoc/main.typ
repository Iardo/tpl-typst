#import "header.typ": header
#import "footer.typ"

#let designdoc(
  title: "",
  author: "",
  caption: "",
  date: datetime.today(),
  collaborators: (),
  body,
) = {[
  #set document(
    title: [#title],
    author: author,
    date: datetime.today(),
  )

  #set page(
    numbering: "1",
    header: context {
    if counter(page).get().first() > 1 [
      #set text(style: "italic")
      #title
      #h(1fr)
      #if collaborators != none {[w/ #collaborators]}
      #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
    ]
  })

  #show: header.with(
    title: title,
    caption: caption,
    collaborators: (author)
  )

  #body

  === End of The Document
  We can nest subproblems! #title
]}
