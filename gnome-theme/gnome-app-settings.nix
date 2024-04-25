{ lib, pkgs, ... }:

with lib.hm.gvariant;

{
  xdg.configFile = {
    "gradience/presets/user/aeolus.json".source = ./imports/aeolus.json; # Import a colorscheme
};
  
  # Shell
  programs.fish = {
    enable = true; 
    shellInit = "clear\nneofetch";
  };
  
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./imports/starship.toml; # Import a toml file
  };
 
  dconf.settings = {
             
      # Every moderately important setting is here
      
      "org/gnome/desktop/interface" = { # !!! 
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = "Inter 11";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Inter 11";
      gtk-enable-primary-paste = false;
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Adwaita";
      monospace-font-name = "Liberation Mono 10";
    };
      
      "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      dynamic-workspaces = false;
      edge-tiling = true;
      overlay-key = "Super_L";
      workspaces-only-on-primary = false;
    };

      # Apps  

      "org/gnome/nautilus/list-view" = {
      default-column-order = [ "name" "size" "type" "owner" "group" "permissions" "where" "date_modified" "date_modified_with_time" "date_accessed" "date_created" "recency" "detailed_type" ];
      default-visible-columns = [ "name" "size" "date_modified" ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };
     
     "com/raggesilver/BlackBox" = {
       cursor-blink-mode = mkUint32 0;
       cursor-shape = mkUint32 1;
       font = "FiraCode Nerd Font Medium 12";
       terminal-padding = mkTuple [ (mkUint32 6) (mkUint32 6) (mkUint32 6) (mkUint32 6) ];
    }; 
     
     "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
      titlebar-font = "Inter Semi-Bold 11";
    };
    
      "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      natural-scroll = false;
      speed = -0.20000000000000015;
    };
      
      "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };
     
     "com/github/GradienceTeam/Gradience" = {
      enabled-plugins = [ "firefox_gnome_theme" ];
      first-run = false;
      last-opened-version = "0.4.1";
      user-flatpak-theming-gtk4 = true;
    };
     
      "io/missioncenter/MissionCenter" = {
      apps-page-merged-process-stats = false;
    };
      
      "org/gnome/TextEditor" = {
      spellcheck = true;
    };
    
    # Insanity starts here
    # None of this matters
    
        "org/gnome/desktop/notifications/application/com-discordapp-discord" = {
      application-id = "com.discordapp.Discord.desktop";
    };

    "org/gnome/desktop/notifications/application/com-mattjakeman-extensionmanager" = {
      application-id = "com.mattjakeman.ExtensionManager.desktop";
    };

    "org/gnome/desktop/notifications/application/com-obsproject-studio" = {
      application-id = "com.obsproject.Studio.desktop";
    };

    "org/gnome/desktop/notifications/application/com-raggesilver-blackbox" = {
      application-id = "com.raggesilver.BlackBox.desktop";
    };

    "org/gnome/desktop/notifications/application/com-spotify-client" = {
      application-id = "com.spotify.Client.desktop";
    };

    "org/gnome/desktop/notifications/application/com-usebottles-bottles" = {
      application-id = "com.usebottles.bottles.desktop";
    };

    "org/gnome/desktop/notifications/application/dev-vencord-vesktop" = {
      application-id = "dev.vencord.Vesktop.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/net-brinkervii-grapejuice" = {
      application-id = "net.brinkervii.grapejuice.desktop";
    };

    "org/gnome/desktop/notifications/application/net-lutris-lutris" = {
      application-id = "net.lutris.Lutris.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-boxes" = {
      application-id = "org.gnome.Boxes.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-characters" = {
      application-id = "org.gnome.Characters.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-extensions-desktop" = {
      application-id = "org.gnome.Extensions.desktop.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-gthumb" = {
      application-id = "org.gnome.gThumb.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-software" = {
      application-id = "org.gnome.Software.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-texteditor" = {
      application-id = "org.gnome.TextEditor.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-world-pikabackup" = {
      application-id = "org.gnome.World.PikaBackup.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-krita" = {
      application-id = "org.kde.krita.desktop";
    };

    "org/gnome/desktop/notifications/application/org-mozilla-thunderbird" = {
      application-id = "org.mozilla.Thunderbird.desktop";
    };

    "org/gnome/desktop/notifications/application/org-shotcut-shotcut" = {
      application-id = "org.shotcut.Shotcut.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };
      
      "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };
    
    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ "<Super>n" ];
      shift-overview-down = [ "<Super><Alt>Down" ];
      shift-overview-up = [ "<Super><Alt>Up" ];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true; # Imagine almost accidentally doxxing yourself couldnt be me :3c
      locations = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1709997183;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1709949034;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.23529411852359772 0.3333333432674408 0.4313725531101227 1.0 ]) (mkTuple [ 0.3960784375667572 0.5098039507865906 0.5803921818733215 1.0 ]) (mkTuple [ 0.0 0.0 0.0 0.0 ]) (mkTuple [ 0.11372549086809158 0.125490203499794 0.1411764770746231 1.0 ]) (mkTuple [ 0.11479999870061874 0.12639200687408447 0.14000000059604645 1.0 ]) (mkTuple [ 8.627451211214066e-2 9.803921729326248e-2 0.10588235408067703 1.0 ]) (mkTuple [ 8.746666461229324e-2 9.706667065620422e-2 0.1066666692495346 1.0 ]) (mkTuple [ 7.84313753247261e-2 8.627451211214066e-2 9.41176488995552e-2 1.0 ]) ];
      selected-color = mkTuple [ true 1.0 1.0 1.0 1.0 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "modified";
      sort-directories-first = true;
      sort-order = "descending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 1442 609 ];
    };

    "org/gtk/settings/color-chooser" = {
      selected-color = mkTuple [ true 1.0 1.0 1.0 1.0 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 175;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 35 32 ];
      window-size = mkTuple [ 1231 902 ];
    };



  };
}
