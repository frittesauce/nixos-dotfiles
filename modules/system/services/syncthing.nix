{ ... }:
{
  services.syncthing = {
    enable = true;
    user = "boogieman";
    dataDir = "/home/boogieman";
  };
}
