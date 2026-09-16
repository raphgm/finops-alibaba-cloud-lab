# FinOps on Alibaba Cloud

The allocate → analyze → optimize → automate FinOps loop, applied to Alibaba Cloud specifically: BSS OpenAPI for cost visibility, Cloud Monitor for idle-instance detection, a Resource Manager policy enforcing cost-allocation tags, an automated nightly-shutdown script, and cost-unit creation for team-level allocation.

Companion lab for the article [FinOps on Alibaba Cloud: Cost Visibility, Governance, and Optimization at Scale](https://raphaelgmomoh.pages.dev/articles/finops-on-alibaba-cloud).

`terraform validate` passes clean against the real `aliyun/alicloud` provider (verified locally before this repo was pushed).

---

## 📚 Repository Structure

```text
.
├── README.md
├── terraform/
│   └── main.tf                          # Cost-allocation tag enforcement policy
└── scripts/
    ├── 01-cost-visibility.sh             # BSS OpenAPI monthly bill by product
    ├── 02-find-idle-instances.sh         # Cloud Monitor CPU utilization
    ├── 03-automate-nightly-shutdown.sh   # Stop dev-tagged instances after hours
    └── 04-create-cost-allocation-unit.sh # Team/project cost unit
```

---

## 🛠️ Quick Start

```bash
cd terraform && terraform init && terraform apply   # enforce the tagging policy

cd ../scripts
./01-cost-visibility.sh 2026-09
./02-find-idle-instances.sh "2026-08-01 00:00:00" "2026-09-01 00:00:00"
./04-create-cost-allocation-unit.sh "platform-engineering"
```

---

## License

MIT — use it, fork it, adapt it to your own environment.
