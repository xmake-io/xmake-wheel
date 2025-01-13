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
  # https://github.com/NixOS/nixpkgs/issues/314313#issuecomment-2134252094
  shellHook = ''
    LD="$CC"
  '';
}
