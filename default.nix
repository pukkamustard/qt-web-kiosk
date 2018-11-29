with (import <nixpkgs> {});

stdenv.mkDerivation {
  name = "qt-web-kiosk";

  buildInputs = [
    qt5.full
    pkgconfig
  ];

  src = ./.;

  preBuild = ''
    qmake -o Makefile qt-web-kiosk.pro
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp qt-web-kiosk $out/bin
  '';
}
