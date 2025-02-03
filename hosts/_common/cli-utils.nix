{
  pkgs,
  lib,
  ...
}:
with lib; {
  environment.systemPackages = with pkgs; [
    bat
    coreutils-full
    dust
    eza
    fzf
    gh
    gnutls
    gzip
    just
    perl
    psmisc
    ripgrep
    rsync
    strace
    tealdeer
    tree
    yazi
    xdg-utils
    zoxide
  ];
  programs.git.enable = mkDefault true;
  programs.less.enable = mkDefault true;
  programs.tmux.enable = mkDefault true;
  programs.vim.enable = mkDefault true;
  programs.zsh.enable = mkDefault true;
}
