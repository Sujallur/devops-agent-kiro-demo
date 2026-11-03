#!/usr/bin/env bash
# Back to healthy baseline (code in git, Lambda, and tests).
set -euo pipefail
. "$(dirname "$0")/env.sh"
cd "$DEMO_DIR"
cp demo-private/checkout.good.py app/checkout.py
git checkout -q -- tests 2>/dev/null || true
git add app/checkout.py
git commit -qm "Reset checkout to baseline" || true
git push -q origin HEAD
"$DEMO_DIR/scripts/deploy-code.sh"
"$DEMO_DIR/scripts/load.sh" 3
echo "Healthy baseline restored."
