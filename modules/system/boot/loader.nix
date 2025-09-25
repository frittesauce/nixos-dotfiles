{ ... }:

{

  boot.loader.systemd-boot.enable = false;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.grub = {
	enable = true;
	efiSupport = true;
        devices = [ "nodev" ];
        useOSProber = false;  # 👈 Important line 
	

    extraEntries = ''
        menuentry "Arch Linux (old only works on laptop </3)" {       
        set root='hd0,gpt2'
        linux /boot/vmlinuz-linux root=UUID=aff15c26-0ce5-42b5-9c00-4109ca82bc80 rw init=/usr/lib/systemd/systemd
        initrd /boot/initramfs-linux.img
        }      
    '';	
  };

}