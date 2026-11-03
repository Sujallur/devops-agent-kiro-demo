#!/usr/bin/env bash
# Ships the "Add coupon support" commit (contains the bug) to GitHub and to Lambda, then sends traffic.
set -euo pipefail
. "$(dirname "$0")/env.sh"
cd "$DEMO_DIR"
cp demo-private/checkout.bad.py app/checkout.py
git add app/checkout.py
git commit -qm "Add coupon support"
git push -q origin HEAD
"$DEMO_DIR/scripts/deploy-code.sh"
echo "Sending traffic (orders without a coupon)..."
"$DEMO_DIR/scripts/load.sh" 20
echo "Alarm demo-checkout-errors should reach ALARM in ~1-2 minutes."
