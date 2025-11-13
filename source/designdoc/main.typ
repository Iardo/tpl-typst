#import "header.typ": header
#import "footer.typ"

#let title   = ""
#let auth    = ""
#let uuid    = ""
#let version = none
#let caption = ""
#let collaborators = (auth)
#let abstract = []

#set document(
  title: [#title],
  author: auth,
  date: datetime.today(),
)

#set page(
  numbering: "1",
  header: context {
  if counter(page).get().first() > 1 [
    #set text(style: "italic")
    #title
    #h(1fr)
    // #if collaborators != none {[#collaborators]}
    #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
  ]
})

#show raw: [
  #set text(font: ("Iosevka Custom"))
]

#show: header.with(
  title: title,
  auth: auth,
  uuid: uuid,
  version: version,
  caption: caption,
  collaborators: (auth),
  abstract: abstract,
)

=== Subproblem
We can nest subproblems! #title

=== End of The Document
We can nest subproblems! #title
