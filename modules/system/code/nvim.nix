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
   lua
   unzip
   wget
   go
   composer
   php 
   julia
   pip
 ];
}
