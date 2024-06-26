{
  description = "Catherine's nixos flake";

  # bookmarking this https://nixos-and-flakes.thiscute.world/

  inputs = {
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-flatpak, home-manager, ... }@inputs: {
    nixosConfigurations = {
      "aeolus" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs.inputs = inputs;
        
          modules = [
           ./configuration.nix # system settings
           nix-flatpak.nixosModules.nix-flatpak  
           home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."antikythera" = import ./users/antikythera/antihome.nix; # My user's home manager file, contains mostly packages
              sharedModules = [ # Shared files for a universal theme
               ./gnome-theme/gnome-theme.nix # Anything that can generally be changed in gnome-tweaks or requires importing
               ./gnome-theme/gnome-extensions.nix # Gnome extensions configered via dconf settings
               ./gnome-theme/gnome-app-settings.nix # Gnome app themes/settings 
            ];
          };
         }
        ];
      };
    };
  };
}
