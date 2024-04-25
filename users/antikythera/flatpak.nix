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

    uninstallUnmanaged = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };

    packages = [
      #"com.github.GradienceTeam.Gradience" # Adwatia color scheme maker. Flatpak *CAN* be preferential, it's been iffy for me.
      "io.github.Foldex.AdwSteamGtk" # GTK theme for steam.
      "hu.kramo.Cartridges" # Game launcher like steam, but looks cooler. 
      "net.lutris.Lutris" # Lutris. Flatpak used to avoid dynamically linked executables.
      "org.prismlauncher.PrismLauncher" # FOSS minecraft launcher
      "com.spotify.Client" # Spotify. 
      "com.github.GradienceTeam.Gradience" # GTK Themer
      "io.github.TheWisker.Cavasik" # GUI Cava.
      "com.github.tchx84.Flatseal" # Flatpak permissions.
      "com.discordapp.Discord" # Using the official discord client, vencord doesnt work with my theme.
      "com.bitwarden.desktop" # Bitwarden
      "com.protonvpn.www" # VPN
      "com.github.vikdevelop.photopea_app" # Good photoshop alternative, not FOSS though.
      #"net.brinkervii.grapejuice" # WAS Roblox. Make sure to set renderer to vulkan and target fps to 144.
  ];
 };
}
