#import "../include/00-metadata.typ": *
#import "../../../vendor/gui-typst/source/designdoc/0.1.0/frontpage.typ": frontpage

#show: frontpage.with(
  title: title,
  auth: (auth),
  uuid: uuid,
  version: version,
  caption: caption,
  abstract: abstract,
)
