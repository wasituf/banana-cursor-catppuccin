{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  pname = "banana-cursor-catppuccin";
  version = "1.0";
  src = ./variations;

  installPhase = ''
    mkdir -p $out/share/icons/Banana-Catppuccin-Latte
    mkdir -p $out/share/icons/Banana-Catppuccin-Mocha

    cp -r Banana-Catppuccin-Latte/* $out/share/icons/Banana-Catppuccin-Latte
    cp -r Banana-Catppuccin-Mocha/* $out/share/icons/Banana-Catppuccin-Mocha
  '';

  meta = with pkgs.lib; {
    description = "Banana cursor with Catppuccin themes!";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
  };
}
