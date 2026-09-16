#!/usr/bin/env bash
# Nightly stop of all dev-tagged instances outside business hours --
# the automate step of the allocate/analyze/optimize/automate loop.
# Wire this into a scheduled trigger (cron, or an Alibaba Cloud
# Function Compute timer) rather than running it manually.
set -euo pipefail

echo "Stopping all instances tagged environment=dev..."
aliyun ecs DescribeInstances --Tag.1.Key environment --Tag.1.Value dev \
  | jq -r '.Instances.Instance[].InstanceId' \
  | xargs -I{} aliyun ecs StopInstance --InstanceId {}

echo "Done. Re-run with the equivalent StartInstance call each morning, or gate it behind a schedule."
