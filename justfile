set positional-arguments
set shell := ["bash", "-cue"]
root := justfile_directory()
src := "./src/modos.typ"
pdf := "./build/modos.pdf"
image := "ghcr.io/sdsc-ordes/modos-poster"
tag := "latest"


## Generate poster

# build poster
build-poster *args:
  typst compile \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}}

# continuously rebuild poster on file changes
watch-poster *args:
  typst watch \
    --open \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}} \


## Development environment

# nix development shell
develop-nix:
  nix develop ./tools/nix

# dockerized development shell (alternative to nix)
develop-docker:
  chmod -R 777 ./build
  docker run \
    --user 1000:1000 \
    -it \
    -w "/build/work" \
    --mount type=bind,source="$(pwd)",target=/build/work \
    {{image}}:{{tag}}


## Maintenance

# builds oci image with nix and load into docker
docker-build:
  nix build -L "./tools/nix#image" --out-link "build/image" \
  && docker load < "build/image"

# build and push image
docker-push: docker-build
  docker push {{image}}:{{tag}}
