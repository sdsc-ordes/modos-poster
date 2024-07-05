{
  pkgs ? import <nixpkgs> {},
}:
pkgs.dockerTools.streamNixShellImage {
  name = "https://ghcr.io/sdsc-ordes/modos-poster";
  tag = "dev";
  drv = (import ./shell.nix) { inherit pkgs; };
}
