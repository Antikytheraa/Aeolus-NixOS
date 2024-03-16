{ lib, config, pkgs, ... }:

with lib.hm.gvariant;

{
 
   xdg = {
    dataFile."themes/Marble-blue-dark".source = (pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/imarkoff/Marble-shell-theme/releases/download/2023-11-12/Marble-shell.tar.xz";
    hash = "sha256-0lhbDpPlstWfdJjLZe8rDW4YgbeHzORcYfZg5wyH4EI";
   } + /Marble-blue-dark);
};

# Overall GTK settings

  gtk = {
    cursorTheme = {
      package = bibata-cursors;
      name = "Bibata-Modern-Classic";
 }; 
    
  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;

  iconTheme = {
    package = pkgs.colloid-gtk-theme; 
    name = iconTheme;
    };

  };
};








}


