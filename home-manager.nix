{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.useGlobalPkgs = true; 
  home-manager.users.bonino = {
      # Imports the other configs
      imports = [
          ./homes/bonino/editor.nix
          ./homes/bonino/home-files.nix
          ./homes/bonino/packages.nix
      ];

      # Basic info
      home.username = "bonino";
      home.homeDirectory = "/home/bonino";

      # Let Home Manager install and manage itself.
      programs.home-manager.enable = true;
      programs.git.enable = true;

      home.stateVersion = "23.05"; 
  };
}
