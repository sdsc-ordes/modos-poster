
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
#import "../utils/scripts.typ": *


#let focus-box(
  color: none, 
  body
) = {
    locate(loc =>     
    {
      let primary-color = color-primary.get()
      show heading: set text(white)
      show heading: set align(center+horizon)
      show heading: set block(width: 108.696%, 
                              height: 1.2em, 
                              fill: primary-color)
      if color != none [
        // Overwrite the color if provided
        #let focus-color = color
        #box(
          width: 100%,
          stroke: primary-color+.2em, 
          fill: color,
          inset: 0%,
          [
            #box(
              inset: (top: 0%, left: 4%, right: 4%, bottom: 4%),
              body
              )
          ]
        )
      ] else [
        #let focus-color = color-accent.get() 
        #box(
          width: 100%,
          stroke: none,//primary-color+.2em, 
          fill: focus-color,
          inset: 0%,
          [
            #box(
              inset: (top: 0%, left: 4%, right: 4%, bottom: 4%),
              body
              )
          ]
        )
      ]
  })
}


#let normal-box(
  color: none, 
  body
) = {
    locate(loc =>     
    {
      let primary-color = color-primary.get()
      show heading: set text(white)
      show heading: set align(center+horizon)
      show heading: set block(width: 108.696%, 
                              height: 1.8em,
                              // stroke: primary-color,
                              fill: primary-color,
                              )

      
      if color != none [
        // Overwrite the default if provided
        #let focus-color = color
        #box(
          width: 100%,
          stroke: primary-color+.2em, 
          fill: focus-color,
          inset: 0%,
          outset: 0%,
          [
            #box(
              inset: (top: 0%, left: 4%, right: 4%, bottom: 6%),
              body
              )
          ]
        )
      ] else [
        #let focus-color = color
        #box(
          stroke: none,//primary-color+.2em, 
          fill: color,
          inset: 0%,
          [
            #box(
              inset: (top: 0%, left: 4%, right: 4%, bottom: 4%),
              body
              )
          ]
        )
      ]
  })
}





#let poster-content(
  col: 3, 
  body
)={
    locate(loc =>     
    {
      let primary-color = color-primary.get()
      let bg-color = color-background.get()
      let titletext-color = color-titletext.get()
      let titletext-size = size-titletext.get()

      let current-title = context title-content.get()
      let current-subtitle = context subtitle-content.get()
      let current-author = context author-content.get()
      let current-affiliation = context affiliation-content.get()
      let current-logo-1 = context logo-1-content.get()
      let current-logo-2 = context logo-2-content.get()
      let current-footer = context footer-content.get()

      // Table captions go above
      // TO DO: Numbering is not working properly
      show figure.where(kind:table) : set figure.caption(position:top)
      show figure.caption: it => [
        // #context it.counter.display(it.numbering)
        #it.body
      ] 
      
      // First, need body (hidden) to update header and footer
      block(height: 0pt, hide[#body])
      v(0pt, weak: true)
      
      grid(
        columns: 1,
        rows: (16%, 80%, 4%),
        
        // Top = title row
        [
          #box(
            stroke: none,
            fill: primary-color,
            height: 100%,
            width: 100%,
            inset: 4%,

            grid(
              columns: (75%, 10%, 5%, 10%),
              rows: 100%,
              stroke: none,
                    
              // Left
              [
                #place(horizon)[
                    #set text(size: titletext-size,
                    fill: titletext-color,
                    )
                    *#current-title* #current-subtitle \
                    #set text(size: 0.5em)
                    #current-author \
                    #current-affiliation
                  ]                               
              ],
              
              // Center
              [
                #place(horizon+left)[#current-logo-2] 
              ],
              
              // Extra gap for spacing logos
              [], 
              
              // Right
              [
                #place(horizon+right)[#current-logo-1]
              ]
            )
          )
        ],
        
        // Middle = body
        [
          #box(
            height: 100%,    
            inset: 4%,
            fill: bg-color,
            
            columns(col)[#body]
          )
        ],
        
        // Bottom = footer
        [
          #box(
            stroke: none,
            fill: bg-color,
            height: 100%,
            width: 100%,
            inset: 4%,

            align(right)[#current-footer]
          )
        ]
      )
      
    })

}

