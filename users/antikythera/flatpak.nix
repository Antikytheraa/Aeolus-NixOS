{ config, lib, pkgs, nix-flatpak, ... }:
{
 
 imports = [ nix-flatpak.homeManagerModules.nix-flatpak ];

services.flatpak = {
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];

    uninstallUnmanagedPackages = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };

    packages = [
      #"com.github.GradienceTeam.Gradience" # Adwatia color scheme maker. Flatpak is buggy for me, I use the package
      "com.github.finefindus.eyedropper" # Color picker for making color schemes
      "io.github.Foldex.AdwSteamGtk" # GTK theme for steam.
      "net.brinkervii.grapejuice" # Roblox. Make sure to set renderer to vulkan and target fps to 144.
      "com.github.Matoking.protontricks" # Tweaks for proton if need be. 
      "org.prismlauncher.PrismLauncher" # Minecraft launcher. 
      "net.davidotek.pupgui2" # Installs different wine wrappers for different clients (such as protonGE for steam)
      "hu.kramo.Cartridges" # Game launcher like steam, but looks cooler. 
      "net.lutris.Lutris" # Lutris
      "org.gnome.gThumb" # Photo viewer
      "com.spotify.Client" # Spotify. 
      "dev.alextren.Spot" # Gtk spotify
      "io.github.TheWisker.Cavasik" # GUI Cava.
      "com.github.tchx84.Flatseal" # Flatpak permissions.
      "com.discordapp.Discord" # Using the official discord client, vencord doesnt work with my theme.
      "com.bitwarden.desktop" # Bitwarden
      "ca.desrt.dconf-editor" # Dconf
      #"io.missioncenter.MissionCenter" # Better system monitor # Society if flatpaks stopped randomly fucking working for me
      "com.protonvpn.www" # VPN
      "org.libreoffice.LibreOffice" # Office suite
      "io.github.alainm23.planify" # Todo list
      "md.obsidian.Obsidian" # Notetaking app. 
      "com.obsproject.Studio" # OBS Studio/Video Recorder. Video player specified in configuration.nix
      "com.github.vikdevelop.photopea_app" # Good photoshop alternative, even can save in photoshop files. 
      "org.shotcut.Shotcut" # Video editor
      "org.mozilla.Thunderbird" # Email Client
      "org.kde.krita" # Drawing app
  ];
 };
}
