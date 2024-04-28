{pkgs,...}:
{
    programs.nix-ld.enable = true;
  environment = {
    sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
  };

}