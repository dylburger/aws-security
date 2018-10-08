Tools

* Create a command-line script to create / update templates, and generally handle all the security operations in a single place.

Security

* IAM Overview / examples of best practices
* IAM: roles should read from specific tables and be tightly scoped to necessary services (provide examples)
* [CIS benchmarks](https://d0.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf)
* Enable Cloudtrail
* Encrypt Cloudwatch Logs
* Ensure 2FA on all Console accounts
* Use CloudFormation so that you can have a separate stage and prod account.
* Use read-only accounts so that everything in an account is managed by CloudFormation.
* Use KMS
* Audit KMS
* Rotate KMS keys once a year
* Ensure KMS admin is tightly-restricted
* Cloudwatch alarms to monitor failed logins, changes to IAM policies / roles, bucket policies, etc. (from CIS Benchmarks)
* security@ email, note on responsible disclosure
* TLS: use Certificate Manager. We use the Cert Spotter from SSL Mate to detect when new SSL certs are created / changed (see crt.sh, as well)
* Lambda Edge script to issue CSP headers on Cloudfront responses. Script to enable this for any distro!

AWS Config Rules

* Login: hardware MFA on root account.
* Every 30 days, monitor age of any outstanding access keys > 90 days in age, rotating and disabling
* Cloudtrail logging in all regions. Alerting for Cloudtrail logs being disabled. Alerting for Cloudtrail config changes 
* Record changes to every resource in every region
* For every DDB table, ensure we have backups
* For every DDB table, ensure it's encrypted

Ops

* Lambda script to send Cloudwatch Logs alerts for presence of keywords (keep in separate repo)

