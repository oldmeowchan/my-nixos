# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./boot.nix
      ./nvidia.nix
    ];



  networking.hostName = "mainpc"; # Define your hostname.

  programs.zsh.enable = true;


  users.users.laomei = {
    isNormalUser = true;
    home = "/home/laomei";
    description = "old mei";
    shell= pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
    #hashedPassword = ""; 
  };


  time.timeZone = "Asia/Shanghai";

  networking.proxy.default = "http://192.168.71.4:7890/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  sound.enable = true;
   hardware.pulseaudio.enable = true;



  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    wl-clipboard
  ];



}

