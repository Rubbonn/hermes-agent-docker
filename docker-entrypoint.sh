#!/bin/bash
set -e

HERMES_HOME="${HERMES_HOME:-/root/.hermes}"
mkdir -p "$HERMES_HOME"

FIRST_RUN_MARKER="$HERMES_HOME/.first_run_done"

if [ -t 0 ] && [ ! -f "$FIRST_RUN_MARKER" ]; then
  echo "Primo avvio: esecuzione di 'hermes setup'..."
  hermes setup
  touch "$FIRST_RUN_MARKER"
fi

exec "$@"
