{ _ }:

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  hardware.alsa.enablePersistence = true;
  # it is the part of the kernel that provides an api for sound card device driver
  # I would want to put it in hardware layer, but it would be unclear about its purpose
}
