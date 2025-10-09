{ pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "d";
    baseIndex = 1;
    newSession = false;
    escapeTime = 0;
    mouse = true;
    clock24 = true;
    historyLimit = 1000;
    plugins = with pkgs.tmuxPlugins; [
      mode-indicator
      catppuccin
    ];

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
      set-option -gw xterm-keys on

      unbind-key :
      bind-key \; command-prompt

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key -n C-Tab next-window
      bind-key -n C-BTab previous-window

      set -g status-right '#{tmux_mode_indicator}'
     
    '';
  };
}
