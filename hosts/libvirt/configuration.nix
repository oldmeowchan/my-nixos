# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only
  
  networking.hostName = "libvirt";

  virtualisation.waydroid.enable = true;
  security.polkit.enable =true;

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    lunarvim
    direnv
    nixpkgs-fmt
    nil
    clash-meta
    kitty
    #xdg-desktop-portal-hyprland
    dconf
    nixd
    #clash-geoip
  ];

  users.users.laomei = {
    isNormalUser = true;
    home ="/home/laomei";
    description= "old mei";
    extraGroups = ["wheel" "networkmanager"];
    #hashedPassword = ""; 
  };


 
  






  networking.proxy.default = "http://192.168.122.1:7890/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}

