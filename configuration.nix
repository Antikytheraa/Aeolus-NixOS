# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  #Hardware
  imports =
    [
      ./hardware-configuration.nix
    ]; 

    # Microcode
  hardware.cpu.amd.updateMicrocode = true; #Obviously change this to your CPU brand

    # Zram optimizations
  zramSwap.enable = true;
  zramSwap.priority = 100;
  boot = {
    kernel.sysctl = {
      "vm.swappiness" = 180;
      "vm.watermark_boost_factor" = 0;
      "vm.watermark_scale_factor" = 125;
      "vm.page-cluster" = 0;
    };
  };

    # GPU
  hardware = {
    opengl = { # Drivers
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      ];
    };
  };

    # Openrazer, polychromatic package installed below.
  hardware.openrazer.enable = true;


  # Nix
    # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
    # Enable git for nix flakes 
  programs.git.enable = true;
    # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Boot
    # Grub
  boot.consoleLogLevel = 0;
  boot.loader.timeout = 30;
  boot.loader.grub.enable = true;
  boot.loader.grub.gfxmodeEfi = "1920x1080";
  boot.loader.grub.devices = [ "nodev" ]; 
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
    # Plymouth
  boot.plymouth.enable = true; 
  boot.initrd.verbose = false; 
  boot.kernelParams = [ "quiet" "udev.log_level=0" ];
    # Kernel modules
  boot.initrd.kernelModules = [ "amdgpu" ];


  # Misc Themes
    # Grub Themes
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
  pname = "distro-grub-themes";
  version = "3.1";
  src = pkgs.fetchFromGitHub {
    owner = "AdisonCavani";
    repo = "distro-grub-themes";
    rev = "v3.1";
    hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
  };
  installPhase = "cp -r customize/nixos $out";
};  
    # Plymouth Theme 
#  boot.plymouth = {
#  theme = "nixos-bgrt"
#  themePackages = [ pkgs.nixos-bgrt-plymouth ];
#  };
 
  # Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Networking  
    # Enable networking
  networking.networkmanager.enable = true;  
 
    # Hostname
  networking.hostName = "aeolus"; 


  # Locale
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Desktop Environment & other
    # Gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
    # Enable x11
  services.xserver.enable = true;
    # Configure x11
  services.xserver.xkb.variant = "";
  services.xserver.xkb.layout = "us";
  services.xserver.videoDrivers = [ "amdgpu" ];
    
    # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };




  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.antikythera = {
    isNormalUser = true;
    description = "AntiKythera";
    extraGroups = [ "networkmanager" "wheel" "audio" "plugdev" "openrazer" ];
    packages = with pkgs; [
    firefox
    ];
  };

  # Misc system packages
  environment.systemPackages = with pkgs; [
    vim # Common Utils/packages I want available for multiple users (not defined here)
    wget
    curl 
    inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor # GUI frontend for nix config editing. 
    inputs.nix-software-center.packages.${system}.nix-software-center # GUI nix frontend
    libsForQt5.qt5ct # Configuration tool for qt5
    qt6Packages.qt6ct # Configuration tool for qt6
    libsForQt5.qtstyleplugin-kvantum # Kvantum for qt5
    qt6Packages.qtstyleplugin-kvantum # Kvantum for qt6
    clapper # Used for a gnome extension I use called Hanabi, animated wallpaper on gnome. Needs clappersink. 
    adw-gtk3 # Gtk theme
    inter # Font
    gtop # Needed for another extension
    gnome-menus # Needed for extension.
    gnomeExtensions.arcmenu # Gnome doesnt like the extension, you might have to install it as a package 
    nerdfonts # Nerdfonts
    starship # Starship
    mangohud #FPS counter
  ];
  
  # Steam. 
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
};

  # Gamemode, applies temporary performance fixes when gaming.
  programs.gamemode.enable = true;


  # Disable packages 
environment.gnome.excludePackages = with pkgs.gnome; [
 cheese # photo booth
 eog # image viewer 
 epiphany # web browser
 simple-scan # document scanner 
 totem # video player
 yelp # help viewer 
 evince # document viewer
 geary # email client
 seahorse # password manager
 pkgs.loupe # Another image viewer. 
 gnome-calendar gnome-clocks gnome-contacts
 gnome-maps gnome-music gnome-disk-utility
 pkgs.gnome-connections pkgs.gnome-tour gnome-system-monitor pkgs.gnome-console 
];

  # Trying out Doas. Shamelessly stolen from the wiki.
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [{
    users = ["antikythera"];
    keepEnv = true;  # Optional, retains environment variables while running commands
    persist = true;  # Optional, only require password verification a single time
  }];


  # Flatpak 
  services.flatpak.enable = true;
  
   system.stateVersion = "24.05"; # Did you read the comment?
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "03:45" ]; # Optional; allows customizing optimisation schedule
  nix.settings.auto-optimise-store = true;
}
