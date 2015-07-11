{ stdenv
, pkgs ? (import <nixpkgs> {})
}:

let
  env = with pkgs; [
    bundler
    ruby_2_2_0
    nodejs
  ];
in

stdenv.mkDerivation rec {
    name = "unfug.org";
    src = ./.;
    version = "0.0.0";

    buildInputs = [ env ];

}

