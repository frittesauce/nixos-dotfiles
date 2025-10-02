{ pkgs, ...}: 

{ 
 environment.systemPackages = with pkgs; [
    kotlin
    kotlin-language-server
    kotlin-native
    zulu24
    gradle
    android-studio
  ];
}