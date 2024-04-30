{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rustc
    cargo
    nixd
    nixpkgs-fmt
    rust-analyzer
    zsh
  ];

}
