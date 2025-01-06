{...}: {
  services.openssh = {
    enable = true;
    # disable RSA keys
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        rounds = 64;
        type = "ed25519";
      }
    ];
    settings.PermitRootLogin = "no";
    allowSFTP = true;
  };
}
