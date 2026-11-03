#!/usr/bin/env bash
# Zips app/checkout.py and ships it to the Lambda (what a CI/CD deploy would do).
set -euo pipefail
. "$(dirname "$0")/env.sh"
ZIP="$(mktemp -d)/checkout.zip"
(cd "$DEMO_DIR/app" && zip -q "$ZIP" checkout.py)
aws lambda update-function-code --function-name "$FUNCTION_NAME" --zip-file "fileb://$ZIP" >/dev/null
aws lambda wait function-updated --function-name "$FUNCTION_NAME"
echo "Deployed app/checkout.py to $FUNCTION_NAME"
