// [v1.0] Tim Xie, Fall 2025
// Please retain attribution for future semesters, and direct any questions to xie@berkeley.edu.

#import "utils.typ": *

// layout styles (footer, header)
#let header(courseid, coursename, semester, title, assignment) = {
  box(height: 75pt, [
    #box(height:35pt)[
      #line(length: 100%, stroke: 1pt)

      #v(-16pt)

      #align(center)[
        #smallcaps[#text(title, size: 21pt, tracking: -0.025em)]
        #v(-18pt)
        #text(assignment, size: 11pt)
      ]

      #v(-5pt)

      #line(length: 100%, stroke: 1pt)
    ]

    #v(4pt)

    #smallcaps[#text(courseid + ": " + coursename, tracking: 0.003em, size: 11pt)]
    #h(1fr)
    #smallcaps[#text("UC Berkeley, " + semester, tracking: 0.003em, size: 11pt)]

    #v(0pt, weak: true)
  ])
}

#let assignment(doc, courseid: "Data XX", coursename: "Data Science", semester: "Fall 2025", assignment: "Discussion 01", title: "Intro", sols: false) = {
  // text styles
  show link: this => {
    underline(this)
  }

  set par(justify: true)
  set text(size: 10pt)
  show smallcaps: set text(font: "Libertinus Serif")

  // custom raw for print
  // https://github.com/typst/typst/issues/1331

  show raw: set text(size: 8pt)

  show raw: it => context {
    if docmode.get() != "print" or it.theme == none { return it }
    let fields = it.fields()
    let text = fields.remove("text")
    _ = fields.remove("lines")
    fields.at("theme") = none
    raw(..fields, text)
  }

  // table styles
  show table.cell: set text(size: 9pt)
  show table.cell.where(y: 0): set text(size: 9pt, weight: 700)

  // enum styles, https://forum.typst.app/t/how-can-i-format-an-enums-numbering-without-overriding-the-numbering-style/3246
  set enum(
    full: true, 
    numbering: (..nums, last) => {
    text(
      weight: "bold", 
      numbering(("(a)","i.").at(nums.pos().len(), default: "1."), last)
    )
  }
  )

  set table(
    stroke: (x, y) => (
    left: if x == 0 { 0.5pt } else { 0pt },
    right: 0.5pt,
    top: if y <= 1 { 0.5pt } else { 0pt },
    bottom: 0.5pt,
  ),
    fill: (_, y) =>
    if calc.even(y) { luma(245) }
    else { white },
    inset: (x: 10pt, y: 5pt),
  )

  // format page (margins, set footer)
  set page(
    margin: (top: 1.65cm, bottom: 2.6cm, left: 1.65cm, right: 1.65cm),
    footer: context [
    #if(counter(page).get().at(0) == 1) [] else [
    #line(length: 100%, stroke: 0.75pt)
    #v(-8pt)
    #smallcaps[#courseid #semester]
    #h(1fr)
    #smallcaps[#assignment] | #counter(page).display()
  ]
  ],
    paper: "us-letter"
  )


  // set doc
  set document(
    title: assignment + " " + courseid + " " + semester,
    author: courseid + " Staff"
  )

  header(courseid, coursename, semester, title, assignment)

  doc
}
