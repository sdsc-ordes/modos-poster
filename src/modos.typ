// Import a theme
#import "/src/sdsc_poster.typ": *
#import themes.boxes: *


// Set up paper dimensions and text
#set page(width: 120cm, height: 180cm)
#set text(font: "Verdana", size: 32pt)

// Set up colors
#show: theme.with()

#show "zarr": it => box[
  #box(image(
    "/assets/images/logos/zarr.png",
    height: 1em
  ))
  #it
]

// Add content
#poster-content[

  // Add title, subtitle, author, affiliation, logos
  #poster-header(
    title: [MultiOmics Digital Objects (MODOs):],
    subtitle: [One object to rule them all],
    authors: [Cyril Matthey-Doret, Almut Lütge, Assaf Sternberg, Oksana Riba Grognuz],
    logo-1: image("/assets/images/logos/modos.png", width: 90%),
  )

  // Include content in the footer
  #poster-footer[
    #set text(fill: black)
    zarr: a hierarchical format for the storage of chunked, compressed, N-dimensional arrays
      #grid(
        columns: 3,
        gutter: 5mm,
        image("/assets/images/logos/sdsc.jpg", height: 2cm),
        image("/assets/images/logos/smoc.jpg", height: 2cm),
        image("/assets/images/logos/phrt.png", height: 2cm),
      )
  ]

  // normal-box is used to create sections
  #normal-box()[
    = Challenges
    - Traceability and synchronization of *metadata* across omics layers
    - distributed domain knowledge and data *storage*
    - produce *FAIR* data to facilitate further reseach
  ]

  // color can be overwritten
  #normal-box(color: rgb("#7e87bdff"))[
    = Objectives
    - queryable, linked metadata
    - automatic metadata synchronisation
    - efficient compression
    - remote streaming access
    - standardization
    #figure(image("/assets/images/figures/multiomics.png", width: 50%),
    caption: [_Synchronizing multiomics data within one digital object_])
    ]
  
  #normal-box()[
    = MODOs design
    - hierarchical zarr archives for arrays
    - associated omics data files
    - metadata with formal schema linking all artifacts
    #figure(image("/assets/images/figures/digital-object.png", width: 100%),
    caption: [_Hierarchical object structure with metadata, arrays and files_])
    ]
  
  #normal-box()[
    = MODOs server
    - htsget server to stream genomics data
    - S3 bucket for data storage
    - modos-server exposing a REST api
    //caption: [_Server structure to allow remote storage, access and data streaming_])
    ]

  #focus-box()[
    = Key Findings
    + #lorem(5)
    + #lorem(4)
    + #lorem(8)
    ]
  
  #normal-box()[
    = Discussion
    #lorem(30)
    ]

  // Content can also be added without boxes for more flexible formatting
  = Acknowledgements
  The authors wish to thank those providing guidance, support, and funding.

  = References
  #set text(size: 0.8em)
  + #lorem(8)
  + #lorem(12)
]

