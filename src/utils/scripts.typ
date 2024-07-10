/*
MIT License

Copyright (c) 2024 Daniel King

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// Color and size states
#let color-primary = state("color-primary", teal)
#let color-background = state("color-background", white)
#let color-accent = state("color-accent", yellow)
#let color-titletext = state("color-titletext", black)
#let size-titletext = state("size-titletext", 2em)

// Content states
#let title-content = state("title-body")
#let subtitle-content = state("subtitle-body")
#let author-content = state("author-body")
#let affiliation-content = state("affiliation-body")
#let logo-1-content = state("logo-1-body")
#let logo-2-content = state("logo-2-body")


#let focus-content = state("focus-body")
#let footer-content = state("footer-body")


#let theme(   
  primary-color: rgb("#262262ff"), // Dark blue
  background-color: white,
  accent-color: rgb(243,163,30), // Yellow
  titletext-color: white,
  titletext-size: 2em,
  body,
) = {
  set page(
    margin: 0pt,
  )

  color-primary.update(primary-color)
  color-background.update(background-color)
  color-accent.update(accent-color)
  color-titletext.update(color-titletext => titletext-color)
  size-titletext.update(size-titletext => titletext-size)
 
  body  
}


#let poster-header(
  title: none,
  subtitle: none,
  authors: none,
  affiliation: none,
  logo-1: none,
  logo-2: none,
  // text-color: none,
  // body
) = {
  title-content.update(title-body => title)
  subtitle-content.update(subtitle-body => subtitle)
  author-content.update(author-body => authors)
  affiliation-content.update(affiliation-body => affiliation)
  logo-1-content.update(logo-1-body => logo-1)
  logo-2-content.update(logo-2-body => logo-2)
}


#let poster-footer(
  footer-kwargs: none,
  body
) = {
  footer-content.update(footer-body => body)
}

