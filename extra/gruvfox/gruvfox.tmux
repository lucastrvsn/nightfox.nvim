#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: gruvfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/gruvfox/gruvfox.tmux
set -g mode-style "fg=#1e1e1e,bg=#ab997b"
set -g message-style "fg=#1e1e1e,bg=#ab997b"
set -g message-command-style "fg=#1e1e1e,bg=#ab997b"
set -g pane-border-style "fg=#ab997b"
set -g pane-active-border-style "fg=#8bb2ab"
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#ab997b,bg=#1e1e1e"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-left "#[fg=#1e1e1e,bg=#8bb2ab,bold] #S #[fg=#8bb2ab,bg=#1e1e1e,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#1e1e1e,bg=#1e1e1e,nobold,nounderscore,noitalics]#[fg=#8bb2ab,bg=#1e1e1e] #{prefix_highlight} #[fg=#ab997b,bg=#1e1e1e,nobold,nounderscore,noitalics]#[fg=#1e1e1e,bg=#ab997b] %Y-%m-%d  %I:%M %p #[fg=#8bb2ab,bg=#ab997b,nobold,nounderscore,noitalics]#[fg=#1e1e1e,bg=#8bb2ab,bold] #h "
setw -g window-status-activity-style "underscore,fg=#786c57,bg=#1e1e1e"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#786c57,bg=#1e1e1e"
setw -g window-status-format "#[fg=#1e1e1e,bg=#1e1e1e,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1e1e1e,bg=#1e1e1e,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1e1e1e,bg=#ab997b,nobold,nounderscore,noitalics]#[fg=#1e1e1e,bg=#ab997b,bold] #I  #W #F #[fg=#ab997b,bg=#1e1e1e,nobold,nounderscore,noitalics]"
