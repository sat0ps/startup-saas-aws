\# Terraform (AWS) — Portfolio Wiring



Example of how modules could be composed (not meant to run as-is):



\- `vpc`: 2 AZs, public/private subnets, NAT

\- `eks`: cluster + one managed node group (private subnets)

\- `ecr`: image registry for app images



