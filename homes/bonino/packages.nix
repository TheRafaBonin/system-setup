{ config, pkgs, ... }:

{
  home.packages = [
    # Browsers
    pkgs.chromium
    pkgs.firefox

    # Communication
    pkgs.telegram-desktop

    # Multi-media
    pkgs.nomacs
    pkgs.vlc

    # Languages
    pkgs.go
    pkgs.rustup
  ];
}
