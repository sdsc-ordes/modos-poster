# modos-poster
Poster presentation of modos (multi-omics digital object system).

## Setup

>[!NOTE]
> You will need `just` to run the instructions below ([installation](https://github.com/casey/just?tab=readme-ov-file#packages)), and and [nix](https://nixos.org/) or [docker](https://www.docker.com/) to use the provided development shell.

A nix shell with all dependencies is provided for reproducibility. It can be used in two ways:

With nix:

```shell
just develop
```

Or with docker:

```shell
just docker-run
```

## Usage

The presentation uses [typst](https://typst.app) with the [postercise](https://typst.app/universe/package/postercise/) package.

To compile the poster PDF, run `just build`.

