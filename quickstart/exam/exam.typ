#import "../../lib/exam.typ": *

#show: doc => exam(doc,
  courseid: "Data C100",
  coursename: "Principles & Techniques of Data Science",
  semester: "Fall 2025",
  instructor: "",
  examtitle: "Midterm",
  date: "7:10–9:00pm  Friday, October 17th 2025",
  length: "110 minutes",
  instructions: include("instructions.typ"),
  blanks: ("Your Name", "Your Student ID", "Your Exam Room", "the Name of Person to your Left", "the Name of Person to your Right", "Your GSI's Name (Write N/A if in Self-Service)"),
  extra: include("extra.typ"),
  sols: false
)

#docmode.update("screen")

#let section = section.with(number: true, points: true)

