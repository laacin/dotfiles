if status is-interactive
    # Commands to run in interactive sessions can go here
    tmux
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

function fish_greeting
end

functions -e fish_right_prompt
set -g fish_greeting ""
set -g theme_nerd_fonts yes
set -g theme_display_welcome no
set -g theme_color_scheme catppuccin-mocha
