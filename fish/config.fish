if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx PATH /usr/local/go/bin $PATH
zoxide init fish | source
alias sl="ls"
set -gx PATH $HOME/go/bin $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx PATH /usr/local/go/bin $HOME/go/bin $PATH
alias zl="zellij"

function wingocode
    cd /mnt/d/GoCode
end
export PATH="$HOME/.local/bin:$PATH"

# Fix WSLg Wayland socket path for wl-clipboard / Claude Code image paste
if test -n "$WSL_DISTRO_NAME"
    if test -n "$XDG_RUNTIME_DIR"
        mkdir -p "$XDG_RUNTIME_DIR"
        if test -S /mnt/wslg/runtime-dir/wayland-0
            ln -sf /mnt/wslg/runtime-dir/wayland-0 "$XDG_RUNTIME_DIR/wayland-0"
        end
        if test -e /mnt/wslg/runtime-dir/wayland-0.lock
            ln -sf /mnt/wslg/runtime-dir/wayland-0.lock "$XDG_RUNTIME_DIR/wayland-0.lock"
        end
    end
end
