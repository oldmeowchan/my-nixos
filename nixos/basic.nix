{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree =true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  boot.kernelPackages  =  pkgs.linuxPackages_zen;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  networking.networkmanager.enable = true;

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  system.stateVersion = "unstable";
}