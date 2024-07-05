set positional-arguments
set shell := ["bash", "-cue"]
root := justfile_directory()
src := "./src/modos.typ"
pdf := "./build/modos.pdf"


## Generate poster

build *args:
  typst compile \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}}

watch *args:
  typst watch \
    --open \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}} \


## Development environment

# nix development shell
develop:
  nix-shell ./tools/nix/shell.nix

# dockerized development shell (alternative to nix)
docker-run:
  docker run \
    -it \
    -w "/work" \
    --mount type=bind,source="$(pwd)",target=/work \
    "ghcr.io/sdsc-ordes/modos-poster:dev"


## Maintenance

build-image:
  nix build -L "./tools/nix#image" --out-link "build/image" \
  && docker load < "build/image"
