# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "samurai"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Amercica/Sao_Paulo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Internationalization
  i18n = {
    supportedLocales = [ "en_IE.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" "pt_BR.UTF-8/UTF-8" ];
    # For apps using LANG: the closest to what I have with LC_* below
    defaultLocale = "en_IE.UTF8";
    # For apps using LC_*:
    extraLocaleSettings = {
      LC_MESSAGES = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8"; # "pt_BR.UTF8" borks xkbcommon

      LC_NUMERIC = "pt_BR.UTF8";
      LC_TIME = "pt_BR.UTF8";
      LC_COLLATE = "pt_BR.UTF8";
      LC_MONETARY = "pt_BR.UTF8";
      LC_PAPER = "pt_BR.UTF8";
      LC_NAME = "pt_BR.UTF8";
      LC_ADDRESS = "pt_BR.UTF8";
      LC_TELEPHONE = "pt_BR.UTF8";
      LC_MEASUREMENT = "pt_BR.UTF8";
      LC_IDENTIFICATION = "pt_BR.UTF8";
    };
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bonino = {
    isNormalUser = true;
    home = "/home/bonino";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Browsers
      firefox

      # Clipbord manager
      wl-clipboard
      cliphist

      # Languages
      go
    ];
  };
  security.sudo.wheelNeedsPassword = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Basic sofware
    vim
    git
    wget
    tmux
    lshw
    htop
    killall
    pciutils
    pavucontrol

    # Wayland and display
    waybar               # Sistem bar
    dunst                # Notification daemon
    libnotify            # Notification daemon depends on it
    pywal                # Theme color generator
    swww                 # Wallpaper daemon
    kitty                # Terminal emulator
    wlogout              # Logout menu
    rofi-wayland         # App launcher
    swaylock             # Screen locker
    networkmanagerapplet # Networkmanager applet
    grim
    slurp
    swappy
    
    # Tweaks waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    ) 
  ];
  nixpkgs.config.allowUnfree = true;

  # Configure some default fonts
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  # Adds hyperland
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  # Adds desktop portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Configure envinment variables
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Configures bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enABLE = TRue;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

