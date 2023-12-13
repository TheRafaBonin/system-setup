{ config, lib, pkgs, modulesPath, ... }:

{
    
  # Allows unfree nvidia packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
    ];
  

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  # Allows unfree and licenses
  nixpkgs.config.nvidia.acceptLicense = true;
  
  # Configures nvidia drivers
  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;
    
    # Nvidia power management. Experimental
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Use open source kernel module [not nouveau]
    open = false;

    # Enable the Nvidia settings menu [nvidia-settings]
    nvidiaSettings = true;

    # This sets the configuration of the nvidia-laptop
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470; 
  };

  # Configure nvidia for laptop using BUS-ID
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
