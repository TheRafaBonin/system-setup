{ config, pkgs, ... }:

{
  # Imports the other configs
  imports = [
    ./editor.nix
    ./home-files.nix
    ./packages.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bonino";
  home.homeDirectory = "/home/bonino";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git.enable = true;
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.
}
