# Só roda isso em sessões interativas
if status is-interactive

    # zoxide
    zoxide init fish | source
    function cd
        z $argv
    end

    # Pokémon colorido na abertura
    function fish_greeting
        pokemon-colorscripts -r --no-title
    end

    # Aliases com lsd
    alias ls="lsd --icon always --group-dirs first"
    alias ll="lsd -l --icon always --group-dirs first"
    alias la="lsd -la --icon always --group-dirs first"
    alias lt="lsd --tree --icon always"

    # Aliases úteis
    alias vim="nvim"
    alias n="nvim"
    alias py="python"

    # Starship prompt
    starship init fish | source
end

# Paths (fish_add_path handles duplicates automatically)
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/share/omarchy/bin

# Editor padrão
set -gx EDITOR nvim
