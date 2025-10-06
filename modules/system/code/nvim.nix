{ pkgs, ...}: 

{ 
  environment.systemPackages = with pkgs; [
   neovim 
   tree-sitter
   curl
   fzf
   ripgrep
   fd

   python3
   stylua
   ast-grep

  rust-analyzer

   lua
   lua5_1
   luaPackages.luarocks
   unzip
   wget
   go
   
   php 
   phpPackages.composer
  
   julia
  ];
}
