{ config, pkgs, ... }:

{
  home.packages = [
    # Browsers
    pkgs.chromium
    pkgs.firefox

    # Languages
    pkgs.go
  ];
}
