{ lib, config, pkgs, ... }:

with lib.hm.gvariant;

{ # Gnome extensions for the following config file
  home.packages = with pkgs; [
  gtop 
  gnome-menus # Both of the above are dependencies for other extensions
  gnomeExtensions.arcmenu # Im on and off on if I want arcmenu
  # Extensions for the following config file. All extensions below are automatically enabled, and some are QOL changes.
  # Others that I use that aren't necessary to the theme are also installed and will be in a separate category
  gnomeExtensions.blur-my-shell # Adds blur to elements of gnome.
  gnomeExtensions.dash-to-panel # Panel configurations
  gnomeExtensions.gnome-40-ui-improvements # Makes some minor changes to things like overview menu.
  gnomeExtensions.user-avatar-in-quick-settings # Puts your avatar in CC
  gnomeExtensions.media-controls # Media controls in panel. Only shows up when something is playing. 
  gnomeExtensions.quick-settings-tweaker # Allows you to lightly tweak quicksettings
  gnomeExtensions.runcat # Kbitty :3
  gnomeExtensions.settingscenter # Custom commands in Quicksettings. Yet to configure this. 
  gnomeExtensions.vitals # Shows things like CPU temp and ram.  
  # QOL extensions
  gnomeExtensions.disable-workspace-switcher # Decreases visual clutter overall. 
  gnomeExtensions.firefox-pip-always-on-top # Allows for firefox popout videos to be on top of windows
  gnomeExtensions.gsconnect # KDE connect for gnome.
  gnomeExtensions.notification-timeout # Automatically times out notifications (because gnome doesnt do that?) 
  gnomeExtensions.tactile # Gnome tiler. I use alt + semicolon
  # Extensions that arent otherwise necessary start here
  gnomeExtensions.gamemode-indicator-in-system-settings
  gnomeExtensions.just-perfection # A couple system tweaks for misc things
  ]; 
  
  # Insanity starts here
  dconf.settings = {
  
      "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [ "forge@jmmaranan.com" "fq@megh" "customreboot@nova1545" "search-light@icedman.github.com" "overviewhover@mattdavis90" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com" "monitor@astraext.github.io" "compact-quick-settings@gnome-shell-extensions.mariospr.org" "top-bar-organizer@julian.gse.jsts.xyz" "openbar@neuromorph" "paperwm@paperwm.github.com" "arcmenu@arcmenu.com" "apps-menu@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "custom-hot-corners-extended@G-dH.github.com" "desktop-cube@schneegans.github.com" "appindicatorsupport@rgcjonas.gmail.com" ];
      enabled-extensions = [ "Rounded_Corners@lennart-k" "rounded-window-corners@yilozt" "ControlBlurEffectOnLockScreen@pratap.fastmail.fm" "tophat@fflewddur.github.io" "freq-boost-switch@metal03326" "gnome-ui-tune@itstime.tech" "gsconnect@andyholmes.github.io" "blur-my-shell@aunetx" "user-theme@gnome-shell-extensions.gcampax.github.com" "gmind@tungstnballon.gitlab.com" "systemd-status@ne0sight.github.io" "tactile@lundal.io" "firefox-pip@bennypowers.com" "dash-to-panel@jderose9.github.com" "mediacontrols@cliffniff.github.com" "just-perfection-desktop@just-perfection" "notification-timeout@chlumskyvaclav.gmail.com" "SettingsCenter@lauinger-clan.de" "quick-settings-avatar@d-go" "Vitals@CoreCoding.com" "runcat@kolesnikov.se" "quick-settings-tweaks@qwreey" "disable-workspace-switcher-overlay@cleardevice" "switchWorkSpace@sun.wxg@gmail.com" "flypie@schneegans.github.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" ];
      welcome-dialog-last-shown-version = "45.3";
    };
    
    # 99% of these are extensions i personally dont use anymore. Why just keep these around? Ill go through it later and disable the rest
    
    "org/gnome/shell/extensions/SettingsCenter" = {
    show-systemindicator = false; # This is a damn good extension tbh I need to configure this
    };
    
        "org/gnome/shell/extensions/arcmenu" = {
      arc-menu-icon = 24;
      distro-icon = 11;
      enable-menu-hotkey = false;
      menu-background-color = "rgba(48,48,49,0.98)";
      menu-border-color = "rgb(60,60,60)";
      menu-button-appearance = "Icon";
      menu-button-icon = "Distro_Icon";
      menu-foreground-color = "rgb(223,223,223)";
      menu-item-active-bg-color = "rgb(25,98,163)";
      menu-item-active-fg-color = "rgb(255,255,255)";
      menu-item-hover-bg-color = "rgb(21,83,158)";
      menu-item-hover-fg-color = "rgb(255,255,255)";
      menu-separator-color = "rgba(255,255,255,0.1)";
      prefs-visible-page = 0;
    };

        "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.65;
      hacks-level = 3;
      noise-amount = 0.13;
      noise-lightness = 0.14;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      brightness = 1.0;
      customize = true;
      enable-all = false;
      opacity = 235;
      whitelist = [ "org.gnome.Shell.Extensions" "com.mattjakeman.ExtensionManager" "org.gnome.Nautilus" "org.gnome.Settings" "gnome-tweaks" "gradience" "com.github.GradienceTeam.Gradience.Devel" "com.github.GradienceTeam.Gradience" "blackbox" "io.github.Foldex.AdwSteamGtk" "lutris" "org.gnome.baobab" "io.github.alainm23.planify" "dev.vlinkz.NixSoftwareCenter" "org.gnome.Software" "gnome-software" "gnome-control-center" "org.gnome.Extensions" "vesktop" "org.gnome.font-viewer" "io.github.TheWisker.Cavasik" "discord" "io.missioncenter.MissionCenter" "missioncenter" "missioncenter" "com.github.finefindus.eyedropper" "xdg-desktop-portal-gnome" "gthumb" "cavasik" "org.gnome.Weather" "eyedropper" "libreoffice-draw" "com.github.tchx84.Flatseal" "com.raggesilver.BlackBox" "dev.vlinkz.NixosConfEditor" "dconf-editor" "org.gnome.Calculator" "hu.kramo.Cartridges" "libreoffice-writer" "gnome-text-editor" "libreoffice-startcenter" "org.gnome.Logs" "Grapejuice" "nixos-conf-editor" "Waydroid" "gnome-boxes" "adwaita-steam-gtk" "org.gnome.World.PikaBackup" "pika-backup" "dev.alextren.Spot" "dev.alextren.Spot" "dev.alextren.Spot" "spot" ]; # I prefer to manually whitelist apps than blacklist, because I have to blacklist things like games if I dont. 
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      customize = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      customize = true;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      customize = false;
      noise-amount = 0.0;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      customize = false;
      noise-amount = 0.13;
      noise-lightness = 0.14;
    };

    "org/gnome/shell/extensions/blur" = {
      sigma = 30;
    };
    
    "org/gnome/shell/extensions/custom-hot-corners-extended/misc" = {
      show-osd-monitor-indexes = false;
      supported-active-extensions = [];
    };
  
      "org/gnome/shell/extensions/dash-to-panel" = { 
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [ 0 1 ];
      dot-color-dominant = false;
      dot-color-override = false;
      dot-color-unfocused-different = false;
      dot-position = "LEFT";
      dot-size = 4;
      dot-style-focused = "SQUARES";
      dot-style-unfocused = "DOTS";
      focus-highlight = false;
      focus-highlight-color = "#658294";
      focus-highlight-dominant = false;
      focus-highlight-opacity = 20;
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      leftbox-padding = -1;
      multi-monitors = false;
      panel-anchors = ''
        {"0":"MIDDLE","1":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":false,"position":"stackedTL"},{"element":"rightBox","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":false,"position":"stackedTL"},{"element":"rightBox","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}
      '';
      panel-lengths = ''
        {"0":100,"1":100}
      '';
      panel-positions = ''
        {"0":"LEFT","1":"LEFT"}
      '';
      panel-sizes = '' 
        {"0":46,"1":46} 
      '';
      # The panel is buggy if its above ~47 pixels for some reason
      primary-monitor = 0;
      status-icon-padding = -1;
      trans-bg-color = "#658294";
      trans-panel-opacity = 5.0e-2;
      trans-use-custom-bg = true;
      trans-use-custom-opacity = true;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/extensions/flypie" = {
      active-stack-child = "menu-editor-page";
      child-color-mode-hover = "auto";
      menu-configuration = "[{\"name\":\"Example Menu\",\"icon\":\"flypie-symbolic-#46a\",\"shortcut\":\"\",\"centered\":false,\"id\":0,\"children\":[{\"name\":\"Sound\",\"icon\":\"flypie-multimedia-symbolic-#c86\",\"children\":[{\"name\":\"Mute\",\"icon\":\"flypie-multimedia-mute-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioMute\",\"angle\":-1},{\"name\":\"Play / Pause\",\"icon\":\"flypie-multimedia-playpause-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioPlay\",\"angle\":-1},{\"name\":\"Next Title\",\"icon\":\"flypie-multimedia-next-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioNext\",\"angle\":90},{\"name\":\"Previous Title\",\"icon\":\"flypie-multimedia-previous-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioPrev\",\"angle\":270}],\"type\":\"CustomMenu\",\"data\":{},\"angle\":-1,\"showLabels\":false},{\"name\":\"Favorites\",\"icon\":\"flypie-menu-favorites-symbolic-#da3\",\"type\":\"Favorites\",\"data\":{},\"angle\":-1,\"showLabels\":false},{\"name\":\"Next Workspace\",\"icon\":\"flypie-go-right-symbolic-#6b5\",\"type\":\"Shortcut\",\"data\":{\"shortcut\":\"<Control><Alt>Right\"},\"angle\":-1},{\"name\":\"Maximize Window\",\"icon\":\"flypie-window-maximize-symbolic-#b68\",\"type\":\"Shortcut\",\"data\":\"<Alt>F10\",\"angle\":-1},{\"name\":\"Fly-Pie Settings\",\"icon\":\"flypie-menu-system-symbolic-#3ab\",\"type\":\"Command\",\"data\":\"gnome-extensions prefs flypie@schneegans.github.com\",\"angle\":-1},{\"name\":\"Close Window\",\"icon\":\"flypie-window-close-symbolic-#a33\",\"type\":\"Shortcut\",\"data\":\"<Alt>F4\",\"angle\":-1},{\"name\":\"Previous Workspace\",\"icon\":\"flypie-go-left-symbolic-#6b5\",\"type\":\"Shortcut\",\"data\":{\"shortcut\":\"<Control><Alt>Left\"},\"angle\":-1},{\"name\":\"Running Apps\",\"icon\":\"flypie-menu-running-apps-symbolic-#65a\",\"type\":\"RunningApps\",\"data\":{\"activeWorkspaceOnly\":false,\"appGrouping\":true,\"hoverPeeking\":true,\"nameRegex\":\"\"},\"angle\":-1,\"showLabels\":false}],\"type\":\"CustomMenu\",\"data\":{},\"touchButton\":false,\"superRMB\":true,\"showLabels\":false}]";
      stats-abortions = mkUint32 17;
      stats-best-tutorial-time = mkUint32 404;
      stats-click-selections-depth1 = mkUint32 5;
      stats-click-selections-depth3 = mkUint32 4;
      stats-dbus-menus = mkUint32 23;
      stats-gesture-selections-depth3 = mkUint32 13;
      stats-last-tutorial-time = mkUint32 488;
      stats-preview-menus = mkUint32 1;
      stats-selections = mkUint32 22;
      stats-selections-1000ms-depth1 = mkUint32 2;
      stats-selections-1000ms-depth3 = mkUint32 14;
      stats-selections-2000ms-depth3 = mkUint32 15;
      stats-selections-3000ms-depth3 = mkUint32 16;
      stats-selections-500ms-depth3 = mkUint32 4;
      stats-selections-750ms-depth1 = mkUint32 2;
      stats-selections-750ms-depth3 = mkUint32 13;
      stats-settings-opened = mkUint32 4;
      stats-tutorial-menus = mkUint32 23;
      stats-unread-achievements = mkUint32 1;
    };
    
      "org/gnome/shell/extensions/gnome-ui-tune" = {
      hide-search = false;
      increase-thumbnails-size = "100%";
    };
     
      "org/gnome/shell/extensions/mediacontrols" = {
      colored-player-icon = false;
      label-width = mkUint32 200;
      labels-order = [];
      show-player-icon = true;
    };
      
      "org/gnome/shell/extensions/just-perfection" = {
      activities-button = true;
      clock-menu = true;
      clock-menu-position = 0;
      notification-banner-position = 3;
      overlay-key = true;
      panel-in-overview = true;
      quick-settings = true;
      screen-recording-indicator = true;
      screen-sharing-indicator = true;
      startup-status = 1;
      theme = true;
      window-preview-caption = false;
      workspace = true;
      workspace-popup = true;
      workspace-wrap-around = false;
    };
      
      "org/gnome/shell/extensions/quick-settings-avatar" = { 
      avatar-hostname = true;
      avatar-nobackground = false;
      avatar-position = 1;
      avatar-realname = true;
      avatar-size = 43;
    };
        
      "org/gnome/shell/extensions/quick-settings-tweaks" = {
      add-dnd-quick-toggle-enabled = false;
      add-unsafe-quick-toggle-enabled = false;
      datemenu-remove-media-control = true;
      datemenu-remove-notifications = true;
      last-unsafe-state = false;
      list-buttons = "[{\"name\":\"SystemItem\",\"title\":null,\"visible\":true},{\"name\":\"OutputStreamSlider\",\"title\":null,\"visible\":false},{\"name\":\"InputStreamSlider\",\"title\":null,\"visible\":false},{\"name\":\"St_BoxLayout\",\"title\":null,\"visible\":true},{\"name\":\"BrightnessItem\",\"title\":null,\"visible\":false},{\"name\":\"NMWiredToggle\",\"title\":\"Wired\",\"visible\":true},{\"name\":\"NMWirelessToggle\",\"title\":\"Wi-Fi\",\"visible\":true},{\"name\":\"NMModemToggle\",\"title\":null,\"visible\":false},{\"name\":\"NMBluetoothToggle\",\"title\":null,\"visible\":false},{\"name\":\"NMVpnToggle\",\"title\":null,\"visible\":false},{\"name\":\"BluetoothToggle\",\"title\":\"Bluetooth\",\"visible\":true},{\"name\":\"PowerProfilesToggle\",\"title\":\"Power Mode\",\"visible\":true},{\"name\":\"NightLightToggle\",\"title\":\"Night Light\",\"visible\":true},{\"name\":\"DarkModeToggle\",\"title\":\"Dark Style\",\"visible\":true},{\"name\":\"KeyboardBrightnessToggle\",\"title\":\"Keyboard\",\"visible\":false},{\"name\":\"RfkillToggle\",\"title\":\"Airplane Mode\",\"visible\":false},{\"name\":\"RotationToggle\",\"title\":\"Auto Rotate\",\"visible\":false},{\"name\":\"BackgroundAppsToggle\",\"title\":\"No Background Apps\",\"visible\":false},{\"name\":\"MediaSection\",\"title\":null,\"visible\":false},{\"name\":\"Notifications\",\"title\":null,\"visible\":true}]";
      notifications-enabled = true;
      notifications-position = "bottom";
      user-removed-buttons = [];
    };
      
      "org/gnome/shell/extensions/runcat" = { # Kbitty :)
      displaying-items = "character-and-percentage";
      idle-threshold = 5;
    };

    "org/gnome/shell/extensions/vitals" = {
      hide-icons = false;
      hide-zeros = false;
      hot-sensors = [ "_temperature_amdgpu_edge_" "_memory_usage_" ];
      menu-centered = false;
      position-in-panel = 2;
      use-higher-precision = false;
    };
   
      "org/gnome/shell/extensions/tactile" = {
      col-0 = 1;
      col-1 = 1;
      col-2 = 1;
      col-3 = 1;
      layout-2-row-2 = 0;
      layout-3-col-0 = 1;
      layout-3-col-2 = 0;
      layout-3-col-3 = 0;
      layout-3-row-2 = 0;
      layout-4-col-0 = 0;
      monitor-0-layout = 3;
      monitor-1-layout = 2;
      row-0 = 1;
      row-1 = 1;
      row-2 = 1;
      show-tiles = [ "<Alt>semicolon" ]; # Change this to whatever, I personally like alt + semicolon cause I just move my thumb to alt so little hand movement is required
     }; 
    # Some of said extensions I never use

    "org/gnome/shell/extensions/forge" = {
      css-last-update = mkUint32 37;
      focus-border-toggle = true;
      stacked-tiling-mode-enabled = true;
      tabbed-tiling-mode-enabled = false;
      tiling-mode-enabled = true;
    };

    "org/gnome/shell/extensions/forge/keybindings" = {
      con-split-horizontal = [ "<Super>z" ];
      con-split-layout-toggle = [ "<Super>g" ];
      con-split-vertical = [ "<Super>v" ];
      con-stacked-layout-toggle = [ "<Shift><Super>s" ];
      con-tabbed-layout-toggle = [ "<Shift><Super>t" ];
      con-tabbed-showtab-decoration-toggle = [ "<Control><Alt>y" ];
      focus-border-toggle = [ "<Super>x" ];
      prefs-tiling-toggle = [ "<Super>w" ];
      window-focus-down = [ "<Super>j" ];
      window-focus-left = [ "<Super>h" ];
      window-focus-right = [ "<Super>l" ];
      window-focus-up = [ "<Super>k" ];
      window-gap-size-decrease = [ "<Control><Super>minus" ];
      window-gap-size-increase = [ "<Control><Super>plus" ];
      window-move-down = [ "<Shift><Super>j" ];
      window-move-left = [ "<Shift><Super>h" ];
      window-move-right = [ "<Shift><Super>l" ];
      window-move-up = [ "<Shift><Super>k" ];
      window-resize-bottom-decrease = [ "<Shift><Control><Super>i" ];
      window-resize-bottom-increase = [ "<Control><Super>u" ];
      window-resize-left-decrease = [ "<Shift><Control><Super>o" ];
      window-resize-left-increase = [ "<Control><Super>y" ];
      window-resize-right-decrease = [ "<Shift><Control><Super>y" ];
      window-resize-right-increase = [ "<Control><Super>o" ];
      window-resize-top-decrease = [ "<Shift><Control><Super>u" ];
      window-resize-top-increase = [ "<Control><Super>i" ];
      window-snap-center = [ "<Control><Alt>c" ];
      window-snap-one-third-left = [ "<Control><Alt>d" ];
      window-snap-one-third-right = [ "<Control><Alt>g" ];
      window-snap-two-third-left = [ "<Control><Alt>e" ];
      window-snap-two-third-right = [ "<Control><Alt>t" ];
      window-swap-down = [ "<Control><Super>j" ];
      window-swap-last-active = [ "<Super>Return" ];
      window-swap-left = [ "<Control><Super>h" ];
      window-swap-right = [ "<Control><Super>l" ];
      window-swap-up = [ "<Control><Super>k" ];
      window-toggle-always-float = [ "<Shift><Super>c" ];
      window-toggle-float = [ "<Super>c" ];
      workspace-active-tile-toggle = [ "<Shift><Super>w" ];
    };

    "org/gnome/shell/extensions/freq-boost-switch" = {
      boost = true;
    };




    "org/gnome/shell/extensions/paperwm" = {
      restore-attach-modal-dialogs = "";
      restore-edge-tiling = "";
      restore-keybinds = ''
        {}
      '';
      restore-workspaces-only-on-primary = "";
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "3cae3fa3-4fca-45cb-8113-36e8dccae42e" "ef85b0b3-5f60-4bee-8f5f-5d0e909bd5b5" "7985bc5d-b0c4-4695-a193-1bb35ef706ba" "2c4376d0-b711-4483-afce-321a97217da5" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/2c4376d0-b711-4483-afce-321a97217da5" = {
      index = 3;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/3cae3fa3-4fca-45cb-8113-36e8dccae42e" = {
      index = 0;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/7985bc5d-b0c4-4695-a193-1bb35ef706ba" = {
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/ef85b0b3-5f60-4bee-8f5f-5d0e909bd5b5" = {
      index = 1;
    };







    "org/gnome/shell/extensions/search-light" = {
      entry-font-size = 1;
      monitor-count = 2;
      scale-height = 0.1;
      scale-width = 0.1;
      shortcut-search = [ "<Control><Super>s" ];
    };

    "org/gnome/shell/extensions/switchWorkSpace" = {
      switch-workspace = [ "<Super>Tab" ];
      switch-workspace-backward = [ "<Shift><Super>Tab" ];
    };



    "org/gnome/shell/extensions/top-bar-organizer" = {
      center-box-order = [ "Media Controls" "dateMenu" ];
      left-box-order = [ "activities" "places-menu" "ArcMenu" ];
      right-box-order = [ "appindicator-kstatusnotifieritem-polychromatic-tray-applet" "runcat-indicator" "vitalsMenu" "monitor@astraext.github.io" "ForceQuitButton" "screenSharing" "screenRecording" "CustomHotCorners" "dwellClick" "a11y" "keyboard" "quickSettings" ];
   
      };
    }; 
  }
