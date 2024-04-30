{pkgs,...}:
{
  systemd.services.clash ={
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    description = "clash systemd";
    serviceConfig = {
      Type = "simple";
      #ExecStart = ''${pkgs.clash-meta}/bin/clash-meta -d /etc/clash'' ;
      ExecStart = ''${pkgs.clash-meta}/bin/clash-meta -d /etc/clash'' ;
    };
    };
    environment.systemPackages=with pkgs;[clash-meta ];
    
}