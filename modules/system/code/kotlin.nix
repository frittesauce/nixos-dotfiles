{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kotlin
    kotlin-language-server
    kotlin-native
    arduino-ide
    zulu24
    gradle
    android-studio
  ];
  services.mullvad-vpn = {
    enable = true;
    # optional: log in automatically with your account number
    # package = pkgs.mullvad-vpn;  # or pkgs.mullvad if you use the old name
  };
}
