{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "copyfile"
        "copypath"
        "extract"
        "fasd"
        "gitignore"
        "golang"
        "sudo"
      ];
    };
    
    initContent = ''
      eval "$(atuin init zsh)"
      eval "$(fasd --init posix-alias zsh-hook)"
    '';
    
    shellAliases = {
      bat = "bat --theme=base16";
      tree = "exa -l --tree -lhs ext --icons";
      du = "du --total -h --time";
      ls = "eza -l";
    };
    
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "google-chrome-stable";
    };
  };
  
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.eza = {
    enable = true;
  };
  
  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
    };
  };
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "/usr/local/go/bin"
    "$HOME/go/bin"
    "/opt/nvim-linux64/bin"
  ];
}

