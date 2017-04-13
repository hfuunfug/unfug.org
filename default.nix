{ pkgs ? (import <nixpkgs> {}) }:

let
  env = with pkgs; [
    bundler
    ruby_2_3
  ];
in

pkgs.stdenv.mkDerivation rec {
    name = "UnFUG.org";
    src = ./.;
    version = "0.0.0";

    buildInputs = [ env ];

}

