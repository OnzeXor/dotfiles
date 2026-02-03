#!/usr/bin/env bash

# Pega URL/arquivo da capa via MPRIS
url=$(playerctl metadata mpris:artUrl 2>/dev/null)

if [ -z "$url" ]; then
  notify-send "Música" "Sem capa disponível"
  exit 0
fi

tmpfile=""
file=""

if [[ "$url" =~ ^file:// ]]; then
  file="${url#file://}"
else
  tmpfile=$(mktemp --suffix=.jpg)
  if command -v curl >/dev/null 2>&1; then
    curl -L -s "$url" -o "$tmpfile"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$url" -O "$tmpfile"
  fi
  file="$tmpfile"
fi

if [ ! -f "$file" ]; then
  notify-send "Música" "Não consegui baixar a capa."
  exit 1
fi

# Abre a capa numa janelinha. Troca 'imv' pelo viewer que você quiser.
imv "$file" &

# Se baixou temporário, apaga depois de um tempo
if [ -n "$tmpfile" ]; then
  (sleep 30 && rm -f "$tmpfile") &
fi
