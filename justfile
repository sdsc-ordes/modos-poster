set positional-arguments
set shell := ["bash", "-cue"]
root_dir := justfile_directory()

build *args:
  typst compile \
    --root "{{root_dir}}" \
    ./src/modos.typ \
    ./build/modos.pdf \
    {{args}}
