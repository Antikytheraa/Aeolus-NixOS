{ lib, config, pkgs, nix-flatpak, ... }:
{
  # Packages/Flatpaks

  home = {
    username = "antikythera";
    homeDirectory = "/home/antikythera"; 
    stateVersion = "24.05";
    packages = with pkgs; [
    # Most proprietary software are flatpaks (with the exception of steam) as well as apps I can't find as non-flatpaks.
    neofetch # neofetch
    nitch # fetch script 8345290483902
    betterdiscordctl # Betterdiscord installer & updater
    blackbox-terminal # Gtk4 terminal with theming support. Flatpak doesnt work for me.
    clapper # Video player, used for an animated wallpaper gnome extension called hanabi]
    dconf2nix # Dconf settings nixifier for if you're lazy like me.
    eyedropper # Color picker I use for themes. 
    polychromatic # Razer configuration app. 
    gnome.dconf-editor # Advanced gnome configuration
    gnome-extension-manager # Better gnome extensions
    gnome.file-roller 
    gnome.gnome-tweaks # Gnome config app
    gnome.gnome-logs # Systemd log viewer
    #gradience # GTK themer
    gthumb # My preferred image viewer.
    gh # Github
    krita # Drawing app.
    libreoffice-fresh # Libreoffice
    obs-studio # Recorder
    planify # Todo list.
    prismlauncher-unwrapped # Free opensource launcher for minecraft.
    protonup-qt # Proton install manager
    protontricks # Winetricks for proton
    shotcut # Video editor
    thunderbird # Email client
    bibata-cursors # gnome-theme.nix doesnt want to retrieve the cursor package so I just specified it here
    mission-center # system monitor.
    ];
  };

  imports = [ 
  ./flatpak.nix
  ];
  # misc
  xdg.enable = true;
}

