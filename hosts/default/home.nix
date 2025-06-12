{ config, pkgs, ... }:

{
  home.username = "boogieman";
  home.homeDirectory = "/home/boogieman";


  programs.git = {
    enable = true;
    userName = "frittesauce";
    userEmail= "181068943+frittesauce@users.noreply.github.com";
  };

  home.stateVersion = "24.11"; 


  home.packages = [
  ];


  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
