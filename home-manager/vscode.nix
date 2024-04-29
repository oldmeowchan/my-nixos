{pkgs,...}:
{
  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    arcticicestudio.nord-visual-studio-code
    vscodevim.vim
    vscode-extensions.ms-vscode.cpptools
  ];
  };
}