{ pkgs, ...}: 

{ 
 environment.systemPackages = with pkgs; [
    kotlin
    kotlin-language-server
    kotlin-native
    java
  ];
}