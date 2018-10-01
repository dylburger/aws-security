Tools

* Create a command-line script to create / update templates, and generally handle all the security operations in a single place.

Security

* [CIS benchmarks](https://d0.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf)
* Enable Cloudtrail
* Encrypt Cloudwatch Logs
* Ensure 2FA on all Console accounts
* Use CloudFormation so that you can have a separate stage and prod account.
* Use read-only accounts so that everything in an account is managed by CloudFormation.
* Use KMS
* Audit KMS
* For every DDB table, ensure we have backups
* For every DDB table, ensure it's encrypted
* Using AWS Config to manage this

Ops

* Lambda script to send Cloudwatch Logs alerts for presence of keywords (keep in separate repo)
