{ config, pkgs, ... }:
  
{
  # Adds hyperland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    nvidiaPatches = true;
    # enableNvidiaPatches = true;
  };

  # Adds desktop portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Configure envinment variables
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };
}
