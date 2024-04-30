{pkgs,...}
:
{
  environment.systemPackages = with pkgs; [
    rustc
    cargo
    nil
    nixd
    nixpkgs-fmt
    
  ];
  
}
