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

  
  
  
security.polkit.enable =true;


  users.users.laomei = {
    isNormalUser = true;
    home ="/home/laomei";
    description= "old mei";
    extraGroups = ["wheel" "networkmanager"];
    #hashedPassword = ""; 
  };

  programs.nix-ld.enable = true;
 
  virtualisation.waydroid.enable = true;

  environment = {
    sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
  };



  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    direnv
    nixpkgs-fmt
    nil
    clash-meta
    kitty
    xdg-desktop-portal-hyprland
    dconf
    nixd
    #clash-geoip
  ];


  networking.proxy.default = "http://192.168.122.1:7890/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";







}

