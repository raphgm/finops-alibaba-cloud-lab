#!/usr/bin/env bash
# Cost visibility via BSS OpenAPI -- the programmatic equivalent of the
# Azure Cost Management API.
#
# Usage: ./01-cost-visibility.sh <billing-cycle e.g. 2026-09>
set -euo pipefail

BILLING_CYCLE="${1:?Usage: $0 <billing-cycle e.g. 2026-09>}"

echo "=== ECS spend for $BILLING_CYCLE ==="
aliyun bssopenapi DescribeInstanceBill \
  --BillingCycle "$BILLING_CYCLE" \
  --ProductCode ecs \
  --Granularity MONTHLY
