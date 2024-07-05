{
  inputs = { 
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
      nativeBuildInputs = with pkgs; [ just typst ];
    in
    {
      devShells.default = pkgs.mkShell {
        inherit nativeBuildInputs;
      };
      packages = {
        image = pkgs.dockerTools.buildNixShellImage {
          name = "ghcr.io/sdsc-ordes/modos-poster";
          tag = "dev";
          drv = pkgs.mkShell {
            inherit nativeBuildInputs;
          };
        };
      };
    }
  );
}
