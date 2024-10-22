{
  description = "Prebuilt Banana Cursor icons themed to Catppuccin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          banana-cursor-catppuccin = pkgs.stdenv.mkDerivation {
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
          };
        };
      }
    );
}
