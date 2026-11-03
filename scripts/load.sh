#!/usr/bin/env bash
# Invokes the function N times with an order that has no coupon (direct invoke; no public endpoint).
set -uo pipefail
. "$(dirname "$0")/env.sh"
N="${1:-10}"
PAYLOAD='{"items":[{"price":10.0,"qty":2},{"price":5.0,"qty":1}]}'
for _ in $(seq 1 "$N"); do
  aws lambda invoke --function-name "$FUNCTION_NAME" --cli-binary-format raw-in-base64-out \
    --payload "$PAYLOAD" /tmp/demo-checkout-out.json >/dev/null 2>&1
  printf "."; sleep 1
done
echo
