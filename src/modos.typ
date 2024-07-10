// Import a theme
#import "/src/sdsc_poster.typ": *
#import themes.boxes: *


// Set up paper dimensions and text
#set page(width: 120cm, height: 180cm)
#set text(font: "Verdana", size: 33pt)

// Set up colors
#show: theme.with()

// whenever we type zarr, show the logo :p
#show "zarr": it => box[
  #box(image(
    "/assets/images/logos/zarr.png",
    height: 1em
  ))
  #it
]

// Add content
#poster-content(col: 2)[

  // Add title, subtitle, author, affiliation, logos
  // TODO: adjust spacing and sizes
  #poster-header(
    title: [MultiOmics Digital Objects (MODOs):],
    subtitle: [One object to rule them all],
    authors: [Cyril Matthey-Doret, Almut Lütge, Assaf Sternberg, Oksana Riba Grognuz],
    logo-1: image("/assets/images/logos/modos_dark.svg", width: 90%),
  )

  // Include content in the footer
  #poster-footer[
    #set text(fill: black)
      #grid(
        columns: 3,
        gutter: 5mm,
        image("/assets/images/logos/sdsc.jpg", height: 3cm),
        image("/assets/images/logos/smoc.jpg", height: 3cm),
        image("/assets/images/logos/phrt.png", height: 3cm),
      )
    zarr: a hierarchical format for the storage of chunked, compressed, N-dimensional arrays
  ]

  // normal-box is used to create sections
  #normal-box()[
    = Challenges
    - Traceability and synchronization of *metadata* across omics layers
    - distributed domain knowledge and data *storage*
    - produce *FAIR* data to facilitate further reseach
  ]

  // color can be overwritten
  #normal-box(color: rgb("#e0e2efff"))[
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
    - easy interactions via python API or CLI
    #figure(image("/assets/images/figures/architecture_simple.svg", width: 80%))
    ]

  
  #normal-box()[
    = Roadmap
    Development focused on internal deployment without access control so far. 
    Once the deployment is stable, we will focus on scaling the system and adding access control.
    #figure(image("/assets/images/figures/roadmap.svg", width: 100%))
    ]

  #normal-box()[
    = Demo
    // syntax highlighting theme imported from file
    #set raw(theme: "/assets/themes/halcyon.tmTheme")
    #show raw: it => block(
      fill: rgb("#1d2433"),
      inset: 18pt,
      radius: 10pt,
      text(fill: rgb("#a2aabc"), it)
    )

    Remote objects can be accessed viat the python API:
    ```python
    from modos.api import MODO
    modo = MODO(
      "my-bucket/patient_x",
      s3_endpoint="https://modos.example.org/s3"
    )
    modo.list_files()
    for variant in stream_genomics("variants.bcf"):
      print(variant)
    ```
    
    Or via the CLI:
    ```bash
    modos show -s3 'https://modo.example.org'--zarr my-bucket/patient_x
    ```

  ]

  #normal-box(color: rgb("#e0e2efff"))[
    = Want to know more?
    MODOS is open-source!

    We would love to have you try it out and contributions are welcome.
    - Repository: https://github.com/sdsc-ordes/modos-api
    - Documentation: https://sdsc-ordes.github.io/modos-api
    - Data model: https://sdsc-ordes.github.io/modos-schema
  ]

  = Acknowledgements
  The authors wish to thank those providing guidance, support, and funding.


  = References
  #set text(size: 0.8em)
]

