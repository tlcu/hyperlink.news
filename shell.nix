with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "hyperlinks";
  buildInputs = [
    gnumake
    pandoc
    tcl
    tcllib
  ];
  shellHook = ''
    export TCLLIBPATH=/nix/store/gn0w40qwqsqj50zdvdsfz4xdadyw01kb-tcllib-1.20/lib
  '';
}
