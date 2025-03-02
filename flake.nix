{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages."${system}";
    in rec {
      packages.postfix-tlspol = pkgs.callPackage ./. { };
      packages.default = packages.postfix-tlspol;
    }) // {
      overlays.postfix-tlspol = (final: prev: { postfix-tlspol = self.packages."${final.system}".postfix-tlspol; });
      overlays.default = self.overlays.postfix-tlspol;
    };
}
