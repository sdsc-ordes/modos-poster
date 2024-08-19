// Import a theme
#import "/src/sdsc_poster.typ": *
#import themes.boxes: *


// Set up paper dimensions and text
#set page(width: 120cm, height: 180cm)
#set text(font: "Museo", size: 36pt, weight: 100)

#let big_text(t) = text(font: "Century Gothic Paneuropean", weight: 300, t);

// Set up colors
#show: theme.with(titletext-size: 122pt)

// whenever we type zarr, show the logo :p
#let linkml = box[
  #box(image(
    "/assets/images/logos/linkml.png",
    height: 1em
  ))
  linkml 
]
#let zarr = box[
  #box(image(
    "/assets/images/logos/zarr.png",
    height: 1em
  ))
  zarr
]

// Add content
#poster-content(col: 2)[

  // Add title, subtitle, author, affiliation, logos
  #poster-header(
    title: big_text[MultiOmics Digital Objects (MODOS)],
    subtitle: big_text[One object to map them all],
    authors: [
      Cyril Matthey-Doret, Almut Lütge, Assaf Sternberg, Oksana Riba Grognuz
    ],
    affiliation: [Swiss Data Science Center],
    logo-1: image("/assets/images/logos/modos_dark.svg", width: 90%),
  )

  // Include content in the footer
  #poster-footer[
    #set text(fill: black)
    #align(right)[
      #grid(
        columns: 4,
        inset: 12mm,
        image("/assets/images/logos/sdsc.jpg", height: 3cm),
        image("/assets/images/logos/smoc.jpg", height: 4cm),
        image("/assets/images/logos/phrt.png", height: 4cm),
        image("/assets/images/logos/health2030.jpg", height: 4cm),
      )],
  ]

  // normal-box is used to create sections
  #normal-box()[
    #big_text[= Challenges]
    - Omics file are often separated from their context, losing their traceability
    - Large data volumes require efficient storage and access
    - Research data is often siloed and not easily accessible
  ]

  // color can be overwritten
  #normal-box(color: rgb("#e0e2efff"))[
    #big_text[= Objectives]
    #grid(columns: 2, gutter: 10mm,
    [
    - FAIR queryable, linked metadata to facilitate further research
    - automatic metadata sync. across omics
    - efficient compression
    - remote (distributed) streaming access
    - standardization],[
    #figure(image("/assets/images/figures/multiomics.png", width: 50%),
    caption: [_Synchronizing multiomics data within one digital object_])]
  )
    ]
  
  #normal-box()[
    #big_text[= MODOS Design]
    - hierarchical #zarr archives for arrays
    - associated omics data files
    - metadata with formal #linkml schema linking all artifacts
    #figure(image("/assets/images/figures/digital-object-structure.svg", width: 100%),
    caption: [_Hierarchical object structure with metadata, arrays and files_])
    ]
  
  #normal-box()[
    #big_text[= MODOS Server]
    - htsget server to stream genomics data
    - S3 bucket for data storage
    - modos-server exposing a REST api
    - easy interactions via python API or CLI
    #figure(image("/assets/images/figures/architecture_simple.svg", width: 80%))
    ]

  
  #normal-box()[
    #big_text[= Roadmap]
    Development focused on internal deployment without access control so far. 
    Once the deployment is stable, we will focus on scaling the system and adding access control.
    #figure(image("/assets/images/figures/roadmap.svg", width: 100%))
    ]

  #normal-box()[
    #big_text[= Demo]
    // syntax highlighting theme imported from file
    #set raw(theme: "/assets/themes/halcyon.tmTheme")
    #show raw: it => block(
      fill: rgb("#1d2433"),
      inset: 18pt,
      radius: 10pt,
      text(fill: rgb("#a2aabc"), it)
    )

    Remote objects can be accessed viat the CLI or python API:
    #grid(columns: 2, rows: 2, row-gutter: 4mm, column-gutter: 2mm,
      [#box(image("/assets/images/figures/qr-api.png", width: 1.5em)) #big_text[CLI]],
      [#box(image("/assets/images/figures/qr-api.png", width: 1.5em)) #big_text[API]],
      [#text(33pt)[```bash
      $ modos show --zarr s3://bucket/ex data
      /
       └── data
           ├── calls1
           └── demo1

      $ modos show s3://bucket/ex data/demo1
      data/demo1:
        '@type': DataEntity
        data_format: CRAM
        data_path: demo1.cram
        description: Dummy data for tests
        has_reference:
        - reference/reference1
        has_sample:
        - sample/sample1
        name: Demo 1


      $ modos stream s3://bucket/ex/demo1.cram 
      ```]],
      [#text(33pt)[```python
      >>> from modos.api import MODO
      >>> ex = MODO('s3://bucket/ex')
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

      >>> stream = ex.stream_genomics(
        "calls1.bcf", "chr1:103-1321"
      )
      >>> next(stream).alleles
      ('A', 'C')
      ```]],
    )

  ]

  #normal-box(color: rgb("#e0e2efff"))[
    #big_text[= Want to know more?]
    MODOS is open-source!

    We would love to have you try it out, and contributions are welcome.
    #grid(columns: 2, gutter: 10mm,
        [- Repository:], [github.com/sdsc-ordes/modos-api],
        [- Documentation:], [sdsc-ordes.github.io/modos-api],
        [- Data model:], [sdsc-ordes.github.io/modos-schema]
      )
  ]

  #big_text[= Acknowledgements]
  MODOS development is funded by the Personalized Health Data Analysis Hub, a joint initiative of PHRT and SDSC.
 We gratefully acknowledge members of the DAIP team at the Health 2030 Genome Center for their substantial contributions to the development of MODOS by providing test data sets, deployment infrastructure, and expertise


 #big_text[= References]
  #set text(size: 0.8em)
  + Alistair Miles (2024) “zarr-developers/zarr-python: v2.17.0”. Zenodo. doi: 10.5281/zenodo.10659377.
  + Jerome Kelleher, et al. (2019) "htsget: a protocol for securely streaming genomic data", Bioinformatics, doi: 10.1093/bioinformatics/bty492
  
  #big_text[= Notes]
  #zarr: a hierarchical format for the storage of chunked, compressed, N-dimensional arrays

  #linkml: a general purpose modeling language that can be used with linked data, JSON, and other formalisms.

  #box(
    width: 10cm,
    image("/assets/images/logos/cc-by.svg"),
  ) This work is licensed under the #link("https://creativecommons.org/licenses/by/4.0")[Creative Commons Attribution 4.0 International License]
]

