{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraPackages = with pkgs; [
      pyright
      basedpyright
      lua-language-server
      stylua
      ripgrep
      beancount-language-server
      gopls
      go
      nil
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      marksman
      ruff
      lua51Packages.tiktoken_core
      gnumake
      python3Packages.jedi-language-server
      prettier
    ];
    plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
  };

}
