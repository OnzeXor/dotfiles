function deonde
    set alvo $argv[1]

    if test -z "$alvo"
        echo "Uso: deonde <software_ou_comando>"
        return 1
    end

    set encontrou 0

    # Verifica se é um executável e descobre o pacote original que o instalou
    set caminho (command -v $alvo 2>/dev/null)
    set pct $alvo
    if test -n "$caminho"
        set dono (pacman -Qqo $caminho 2>/dev/null)
        if test -n "$dono"
            set pct $dono
        end
    end

    # Checa repositórios nativos (Pacman) vs estrangeiros (AUR)
    if pacman -Qq "$pct" >/dev/null 2>&1
        set encontrou 1
        if pacman -Qm "$pct" >/dev/null 2>&1
            echo -e "\e[1;34m[AUR / Yay]\e[0m O pacote \e[1m$pct\e[0m foi instalado via AUR."
        else
            echo -e "\e[1;36m[Pacman]\e[0m O pacote \e[1m$pct\e[0m é dos repositórios oficiais do Arch."
        end
    end

    # Checa aplicativos no Flatpak
    if type -q flatpak
        set flat_app (flatpak list --columns=name,application | grep -i "$alvo")
        if test -n "$flat_app"
            set encontrou 1
            echo -e "\e[1;32m[Flatpak]\e[0m O software está instalado via Flathub:"
            echo "$flat_app" | while read -l linha
                echo "  -> $linha"
            end
        end
    end

    if test $encontrou -eq 0
        echo -e "\e[1;31m[Não encontrado]\e[0m '$alvo' não consta como instalado via Pacman, AUR ou Flatpak."
    end
end
