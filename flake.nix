{
  description = "<ADD YOUR DESCRIPTION>";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        inherit (nixpkgs) lib;
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells = {
          default = pkgs.mkShell.override {stdenv = pkgs.clangStdenv;} {
            buildInputs = with pkgs; [
              cmake
              ninja
              clang
              clang-tools
              llvmPackages_18.libllvm
              libcxx
            ];
          };
        };

        packages = {
          default = pkgs.stdenv.mkDerivation {
            name = "env";
            # src = ".";
            src = lib.sourceByRegex ./. [
              "^src.*"
              "CMakeLists.txt"
            ];
            nativeBuildInputs = with pkgs; [cmake];
          };
        };
      }
    );
}
