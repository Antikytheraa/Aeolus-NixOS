{ lib, config, pkgs, nix-flatpak, ... }:
{
  # Packages/Flatpaks

  home = {
    username = "antikythera";
    homeDirectory = "/home/antikythera"; 
    stateVersion = "24.05";
    packages = with pkgs; [
    neofetch # neofetch
    hyfetch # BETTER neofetch
    nitch # fetch script 8345290483902
    gnome.file-roller 
    clapper # Video player, used for an animated wallpaper gnome extension called hanabi
    polychromatic # Razer configuration app. 
    gnome.gnome-logs # Systemd log viewer
    gnome-extension-manager # Better gnome extensions
    gnome.gnome-tweaks # Gnome config app
    pkgs.pkgsi686Linux.gperftools # Library for launching TF2
    dconf2nix # Dconf settings nixifier.
    blackbox-terminal # Gtk4 Oneliner Terminal with theming support. Flatpak doesnt work for me.
    betterdiscordctl # Betterdiscord installer & updater
    gradience # GTK themer, flatpak is buggy for me.
    gh
    ];
  };

  imports = [ 
  ./flatpak.nix
  ];

  xdg.enable = true;
}
