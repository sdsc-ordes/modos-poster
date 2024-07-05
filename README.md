# modos-poster
Poster presentation of modos (multi-omics digital object system).

## Setup

A nix shell with all dependencies is provided. It can be used in two ways:

If nix is available on the machine:

```shell
nix shell ./tools/nix/shell.nix

# or if just is installed:
# just develop
```

Or through docker:

```shell
docker run \
  -it \
  --mount type=bind,sources="$(pwd)",target=/build \
  "https://ghcr.io/sdsc-ordes/modos-poster:dev"

# or if just is installed:
# just docker-run
```

## Usage

The presentation uses [typst](https://typst.app) with the [postercise](https://typst.app/universe/package/postercise/) package.

To compile the poster PDF, run `just build`.

