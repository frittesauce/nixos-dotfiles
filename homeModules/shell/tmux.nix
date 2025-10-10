{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      cpu
      battery
    ];

    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g prefix C-z

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g status-position top

      set -g @catppuccin_window_left_separator "█"
      set -g @catppuccin_window_right_separator "█ "
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_middle_separator "  █"

      set -g @catppuccin_window_default_fill "number"

      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#{pane_current_path}"

      set -g @catppuccin_status_modules_right "application session date_time"
      set -g @catppuccin_status_left_separator  ""
      set -g @catppuccin_status_right_separator " "
      set -g @catppuccin_status_right_separator_inverse "yes"
      set -g @catppuccin_status_fill "all"
      set -g @catppuccin_status_connect_separator "no"

      '';

  };



}
