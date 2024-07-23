// Import a theme
#import "/src/sdsc_poster.typ": *
#import themes.boxes: *


// Set up paper dimensions and text
#set page(width: 120cm, height: 180cm)
#set text(font: "Verdana", size: 33pt)

// Set up colors
#show: theme.with()

// whenever we type zarr, show the logo :p
//#show "zarr": it => box[
//  #box(image(
//    "/assets/images/logos/zarr.png",
//    height: 1em
//  ))
//  #it
//]

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
    #figure(image("/assets/images/figures/digital-object-structure.png", width: 100%),
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
    >>> from modos.api import MODO
    >>> ex = MODO('./example-digital-object')
    >>> ex.list_samples()
    ['sample/sample1']
    >>> ex.metadata["data/calls1"]
    {'@type': 'DataEntity',
     'data_format': 'BCF',
     'data_path': 'calls1.bcf',
     'description': 'variant calls for tests',
     'has_reference': ['reference/reference1'],
     'has_sample': ['sample/sample1'],
     'name': 'Calls 1'}
    >>> rec = next(ex.stream_genomics("calls1.bcf", "chr1:103-1321"))
    >>> rec.alleles
    ('A', 'C')

    ```
    
    Or via the CLI:
    ```bash
    $ modos show  -s3 https://s3.example.org --zarr ex-bucket/ex-modo
    /
     ├── assay
     │   └── assay1
     ├── data
     │   ├── calls1
     │   └── demo1
     ├── reference
     │   └── reference1
     └── sample
         └── sample1
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
  #show "zarr": "zarr"
  + Alistair Miles (2024) “zarr-developers/zarr-python: v2.17.0”. Zenodo. doi: 10.5281/zenodo.10659377.
  + Jerome Kelleher, et al. (2019) "htsget: a protocol for securely streaming genomic data", Bioinformatics, doi: 10.1093/bioinformatics/bty492
]

