{ config, pkgs, ... }:

{
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
}
