#!/bin/bash
set -e

HERMES_HOME="${HERMES_HOME:-/root/.hermes}"
mkdir -p "$HERMES_HOME"

FIRST_RUN_MARKER="$HERMES_HOME/.first_run_done"
CONFIG_CANDIDATES=(
  "$HERMES_HOME/config.yaml"
  "$HERMES_HOME/config.yml"
  "$HERMES_HOME/config.toml"
  "$HERMES_HOME/settings.json"
  "$HERMES_HOME/.config/hermes/config.yaml"
)

needs_setup=true
for candidate in "${CONFIG_CANDIDATES[@]}"; do
  if [ -f "$candidate" ]; then
    needs_setup=false
    break
  fi
done

if [ -t 0 ] && [ ! -f "$FIRST_RUN_MARKER" ] && [ "$needs_setup" = true ]; then
  echo "Primo avvio: esecuzione di 'hermes setup'..."
  hermes setup
  touch "$FIRST_RUN_MARKER"
fi

if [ ! -f "$FIRST_RUN_MARKER" ] && [ "$needs_setup" = false ]; then
  touch "$FIRST_RUN_MARKER"
fi

exec "$@"
