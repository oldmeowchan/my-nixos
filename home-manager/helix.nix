{pkgs,config,...}: 


{

  programs.helix = {
    
    enable = true;
    settings = {
      theme = "Boo_berry";
      editor=
      {
              line-number = "relative";
      };
    editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };


   

    };
  };
  
  }

