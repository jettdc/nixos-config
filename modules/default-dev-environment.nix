{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # System-wide Vim config
  environment.etc."vim/vimrc".text = ''
    set mouse=a
  '';
}
