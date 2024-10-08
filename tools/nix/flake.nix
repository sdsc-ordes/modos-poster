{
  inputs = { 
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
      nativeBuildInputs = with pkgs; [
        bash
        coreutils
        curl
        findutils
        git
        jq
        just
        typst
      ];
    in
    {
      devShells.default = pkgs.mkShell {
        inherit nativeBuildInputs;
        shellHook = "unset TMPDIR";
      };
      packages = {
        image = pkgs.dockerTools.buildLayeredImage {
          name = "ghcr.io/sdsc-ordes/modos-poster";
          tag = "latest";
          contents = nativeBuildInputs;
          config = {
            Cmd = [ "/bin/bash" ];
          };
        };
      };
    }
  );
}
