#!/usr/bin/env bash
# Pulls CPU utilization over the last month via Cloud Monitor -- the
# first analysis step for finding instances that are paid for but
# barely used.
#
# Usage: ./02-find-idle-instances.sh <start "YYYY-MM-DD 00:00:00"> <end "YYYY-MM-DD 00:00:00">
set -euo pipefail

START_TIME="${1:?Usage: $0 <start> <end>}"
END_TIME="${2:?Usage: $0 <start> <end>}"

aliyun cms DescribeMetricList \
  --Namespace acs_ecs_dashboard \
  --MetricName CPUUtilization \
  --Period 86400 \
  --StartTime "$START_TIME" \
  --EndTime "$END_TIME"

echo
echo "Instances averaging under ~5% CPU across the period are strong idle candidates --"
echo "cross-reference against 01-cost-visibility.sh output before stopping anything."
