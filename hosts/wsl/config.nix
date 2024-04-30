{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.

    ];



  networking.hostName = "wsl"; # Define your hostname.




  users.users.laomei = {
    isNormalUser = true;
    home = "/home/laomei";
    description = "old mei";
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
    #hashedPassword = ""; 
  };


  time.timeZone = "Asia/Shanghai";

  #networking.proxy.default = "http://192.168.71.4:7890/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


   sound.enable = true;
   hardware.pulseaudio.enable = true;



  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
  ];



}
