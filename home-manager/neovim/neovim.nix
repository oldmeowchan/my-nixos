{pkgs,...}:
{
  programs.neovim = {
  enable = true;
  defaultEditor = true;
  };
    environment.systemPackages = [
    pkgs.lunarvim
   ];
}