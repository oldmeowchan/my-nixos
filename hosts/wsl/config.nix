{ config, lib, pkgs, ... }:

{
  imports =
    [


    ];

    networking.hostName ="wsl";
    wsl.defaultUser ="laomei";




  users.users.laomei = {
    isNormalUser = true;
    home = "/home/laomei";
    description = "old mei";
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
    #hashedPassword = ""; 
  };


  time.timeZone = "Asia/Shanghai";

  #networking.proxy.default = "http://172.29.48.1:7890/";
  networking.proxy.httpProxy = "http://172.29.48.1:7890/";
  networking.proxy.httpsProxy = "http://172.29.48.1:7890/";
  #networking.proxy.noProxy = "0.0.0.0,127.0.0.1,localhost,internal.domain";

   sound.enable = true;
   hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
  ];

}
