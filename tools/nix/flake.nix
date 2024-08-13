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
        image = pkgs.dockerTools.buildImage {
          name = "ghcr.io/sdsc-ordes/modos-poster";
          tag = "latest";
          copyToRoot = pkgs.buildEnv {
            name = "image-env";
            paths = nativeBuildInputs;
            pathsToLink = [ "/bin" ];
          };
          config = {
            Env = [ "PATH=/bin:$PATH" ];
            Cmd = [ "${pkgs.bash}/bin/bash" ];
          };
        };
      };
    }
  );
}
