// Import a theme
#import "/src/sdsc_poster.typ": *
#import themes.boxes: *


// Set up paper dimensions and text
#set page(width: 24in, height: 18in)
#set text(font: "Calibri", size: 28pt)

// Set up colors
#show: theme.with()

// Add content
#poster-content[

  // Add title, subtitle, author, affiliation, logos
  #poster-header(
    title: [MultiOmics Digital Objects (MODOs):],
    subtitle: [One object to rule them all],
    authors: [Cyril Matthey-Doret, Almut Lütge, Assaf Sternberg, Oksana Riba Grognuz],
    logo-1: image("../assets/images/logo-modos.png", width: 90%)
    )

  // Include content in the footer
  #poster-footer[
    #set text(fill: black)
    \*_zarr: a hierarchical format for the storage of chunked, compressed, N-dimensional arrays_
    ]

  // normal-box is used to create sections
  #normal-box()[
    = Challenges
    - synchronizing and standardizing *metadata* between different omics
    - distributed domain knowledge and *data storage*
    - providing *FAIR data* to facilitate further reseach
    ]

  // color can be overwritten
  #normal-box(color: aqua)[
    = Objectives
    - queryable, linked metadata
    - automatic metadata synchronisation
    - efficient compression
    - remote capabilities 
    - standardization
    - streaming
    #figure(image("../assets/images/multiomics.png", width: 50%),
    caption: [_Synchronizing multiomics data within one digital object_])
    ]
  
  #normal-box()[
    = MODOs design
    - modos-schema defines metadata
    - hierarchical *zarr*\* archives
    - associated genomic files
    #figure(image("../assets/images/digital-object.png", width: 100%),
    caption: [_Hierarchical object structure with metadata, arrays and files_])
    ]
  
  #normal-box()[
    = MODOs server
    - htsget server to stream genomics data
    - S3 bucket for data storage
    - modos-server exposing a REST api
    //#figure(image("../assets/images/multiomics.png", width: 50%),
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

