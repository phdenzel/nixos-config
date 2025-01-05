{
  inputs,
  lib,
  config,
  ...
}: with lib; let
  sopsUser = "${home.username}";
  sopsHost = "${config.networking.hostName}";
  secretsFile = "../${user.name}/secrets.yaml";
in {
  # sops.nixosModules.sops import is handled in hosts/_common/sops.nix

  sops = {
    defaultSopsFile = builtins.toPath "${secretsFile}";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      # keyFile = "/var/lib/sops-nix/key.txt";
      # generateKey = true;
    };

    secrets = {
      "passwd/${sopsUser}" = {
        neededForUsers = true;
      };
      "ssh_keys/${sopsHost}" = {
        path = "/home/${sopsUser}/.ssh/";
        owner = "${sopsUser}";
      };
    };
  };
}
