{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;
mkShell {
  name = "xmake-wheel";
  buildInputs = [
    stdenv.cc
    pkg-config
    gnumake

    (python3.withPackages (
      p: with p; [
        uv
        pytest

        hatchling
      ]
    ))
  ];
}
