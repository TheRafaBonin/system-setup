# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
            ./internationalization.nix
            ./home-manager.nix
            ./networking.nix
            ./bluetooth.nix
            ./hyprland.nix
            ./packages.nix
            ./nvidia.nix
            ./fonts.nix
            ./sound.nix
        ];

# Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

# Set your time zone.
    time.timeZone = "America/Sao_Paulo";

# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable bash completion
    programs.bash.enableCompletion = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.bonino = {
        isNormalUser = true;
        home = "/home/bonino";
        extraGroups = [ "networkmanager" "wheel" ];
    };
    security.sudo.wheelNeedsPassword = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It's perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.05"; # Did you read the comment?
}

