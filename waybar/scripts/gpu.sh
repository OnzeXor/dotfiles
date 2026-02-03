#!/usr/bin/env bash

# Script ultra simples: sempre imprime alguma coisa e sai com 0

OUT="N/A"

# ============ NVIDIA ============
if command -v nvidia-smi >/dev/null 2>&1; then
  util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1)
  temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1)

  if [ -n "$util" ] && [ -n "$temp" ]; then
    OUT="${util}% ${temp}°C"
  fi
fi

# (depois a gente melhora pra Intel/AMD se precisar, mas primeiro vamos fazer funcionar)

echo "$OUT"
exit 0
