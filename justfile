set positional-arguments
set shell := ["bash", "-cue"]
root := justfile_directory()
src := "./src/modos.typ"
pdf := "./build/modos.pdf"

build *args:
  typst compile \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}}

watch *args:
  typst watch \
    --open \
    --root "{{root}}" \
    "{{src}}" "{{pdf}}" {{args}} \
