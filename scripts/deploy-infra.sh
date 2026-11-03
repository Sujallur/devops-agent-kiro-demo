#!/usr/bin/env bash
# One-time: creates the Lambda, role and alarm.
set -euo pipefail
. "$(dirname "$0")/env.sh"
aws cloudformation deploy \
  --template-file "$DEMO_DIR/infra/template.yaml" \
  --stack-name "$STACK_NAME" \
  --capabilities CAPABILITY_IAM \
  --no-fail-on-empty-changeset
