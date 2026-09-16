#!/usr/bin/env bash
# Creates a cost unit for allocating spend to a specific team/project --
# without this, a cost report shows the total bill but not whose spend
# it actually is.
#
# Usage: ./04-create-cost-allocation-unit.sh <unit-name>
set -euo pipefail

UNIT_NAME="${1:?Usage: $0 <unit-name>}"

aliyun bssopenapi CreateCostUnit --UnitName "$UNIT_NAME"
