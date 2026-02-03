#!/usr/bin/env bash
set -euo pipefail

bar="▁▂▃▄▅▆▇█"

# monta o "dicionário" do sed
dict='s/;//g;'
for i in $(seq 0 7); do
  dict+="s/$i/${bar:$i:1}/g;"
done

config_file="/tmp/waybar_cava_config"
cat >"$config_file" <<'EOF'
[general]
bars = 18

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Cache de volume (pra não matar o wpctl a cada frame)
last_vol_check=0
vol_tip="Volume: ?%"

get_volume_tooltip() {
  # Ex: "Volume: 0.45" ou "Volume: 0.45 [MUTED]"
  local out v muted pct
  out="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null || true)"

  if [[ -z "${out}" ]]; then
    echo "Volume: ?%"
    return 0
  fi

  v="$(awk '{print $2}' <<<"$out")"
  muted="$(grep -q '\[MUTED\]' <<<"$out" && echo 1 || echo 0)"

  # Converte 0.00–1.00 pra %
  pct="$(awk -v x="$v" 'BEGIN{printf("%d", x*100)}')"

  if [[ "$muted" == "1" ]]; then
    echo "Volume: ${pct}% (mutado)"
  else
    echo "Volume: ${pct}%"
  fi
}

# line-buffer pra não engasgar no waybar
cava -p "$config_file" |
  stdbuf -oL sed -u "$dict" |
  while IFS= read -r line; do
    now="$(date +%s)"
    if ((now != last_vol_check)); then
      last_vol_check="$now"
      vol_tip="$(get_volume_tooltip)"
    fi

    # JSON pro waybar (return-type: json)
    printf '{"text":"%s","tooltip":"%s"}\n' "$line" "$vol_tip"
  done
