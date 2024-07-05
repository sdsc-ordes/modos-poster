set positional-arguments
set shell := ["bash", "-cue"]
root := justfile_directory()
src := "./src/modos.typ"
pdf := "./build/modos.pdf"


## Generate poster

# build poster
build *args:
  typst compile \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}}

# continuously rebuild poster on file changes
watch *args:
  typst watch \
    --open \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}} \


## Development environment

# nix development shell
nix-develop:
  nix develop ./tools/nix

# dockerized development shell (alternative to nix)
docker-develop:
  docker run \
    --user 1001:1001 \
    -it \
    -w "/build/work" \
    --mount type=bind,source="$(pwd)",target=/build/work \
    "ghcr.io/sdsc-ordes/modos-poster:dev"


## Maintenance

# builds oci image with nix and load into docker
build-image:
  nix build -L "./tools/nix#image" --out-link "build/image" \
  && docker load < "build/image"
