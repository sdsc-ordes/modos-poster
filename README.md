# modos-poster

[![DOI](https://zenodo.org/badge/824321703.svg)](https://zenodo.org/doi/10.5281/zenodo.13312849)


Poster presentation of modos (multi-omics digital object system).

## Setup

>[!NOTE]
> You will need `just` to run the instructions below ([installation](https://github.com/casey/just?tab=readme-ov-file#packages)), and and [nix](https://nixos.org/) or [docker](https://www.docker.com/) to use the provided development shell.

A nix shell with all dependencies is provided for reproducibility. It can be used in two ways:

With nix:

```shell
just develop-nix
```

Or with docker:

```shell
just develop-docker
```

## Usage

The presentation uses [typst](https://typst.app) with the [postercise](https://typst.app/universe/package/postercise/) package.

To compile the poster PDF, run `just build-poster`.
You may also `just watch-poster` to continuously rebuild the poster on source changes.


## Acknowledgement

The template is derived from [postercise](https://github.com/dangh3014/postercise).
