#!/usr/bin/env bash
# Sourced by the other scripts. Set AWS_PROFILE (or exported creds) for the DEMO account first.
export AWS_REGION="${AWS_REGION:-us-east-1}"
export AWS_DEFAULT_REGION="$AWS_REGION"
export STACK_NAME="${STACK_NAME:-devops-agent-kiro-demo}"
export FUNCTION_NAME="demo-checkout"
export DEMO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)"
