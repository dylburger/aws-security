### Usage

You can create a new CAA record for a given Hosted Zone by passing the hosted zone name as an argument to the [`create-caa-record.sh`](https://github.com/dylburger/aws-security/blob/master/caa-records/create-caa-record.sh) script:

```
./create-caa-record.sh domain.name.
```
Note that Route 53 typically creates hosted zones with a trailing `.` after the domain name.

This script creates a CloudFormation stack but requires that you create the resources tied to the initial change set, which you can do using the AWS CLI or in the CloudFormation UI.

### What is a CAA record?

From [the RFC](https://tools.ietf.org/search/rfc6844):

> The Certification Authority Authorization (CAA) DNS Resource Record allows a DNS domain name holder to specify one or more Certification Authorities (CAs) authorized to issue certificates for that domain. CAA Resource Records allow a public Certification Authority to implement additional controls to reduce the risk of unintended certificate mis-issue.

### Why add a CAA record?

This is a low-cost way to reduce the risk that a certificate for your domain will be issued by a Certificate Authority (CA). Most CAs will check for the presence of a CAA record and, according to RFC 6844, will only issue it when:

> either (1) the certificate request is consistent with the applicable CAA Resource Record set or (2) an exception specified in the relevant Certificate Policy or Certification Practices Statement applies

This was [adopted by the CA/Browser Forum](https://cabforum.org/2017/03/08/ballot-187-make-caa-checking-mandatory/) (collection of most CAs and Browsers), effective September 8, 2017.

[Wikipedia](https://en.wikipedia.org/wiki/DNS_Certification_Authority_Authorization#Background) has more background covering the security issues that led to the CAA's creation.

### AWS Support

AWS started [supporting CAA records](https://aws.amazon.com/about-aws/whats-new/2017/08/amazon-route-53-now-supports-caa-records/) on August 21, 2017.

AWS supports configuring CAA records in [Route53 Cloudformation templates](https://docs.aws.amazon.com/Route53/latest/APIReference/API_ResourceRecordSet.html#Route53-Type-ResourceRecordSet-Type).

* [AWS Guide - Configure a CAA record](https://docs.aws.amazon.com/acm/latest/userguide/setup-caa.html)
* [serverfault - more notes on AWS Support](https://serverfault.com/a/873139)

### Notes on the CloudFormation Template

[Amazon states](https://docs.aws.amazon.com/acm/latest/userguide/setup-caa.html):

```
if you do not have a CAA record that specifies one of the following four Amazon CAs, 
ACM cannot issue a certificate to your domain or subdomain:

* amazon.com
* amazontrust.com
* awstrust.com
* amazonaws.com
```

The `TTL` field was set to a low value specifically because setting a high TTL for a CAA record can cause problems when you published an incorrect record.

### The `iodef` property

From [RFC 6844](https://tools.ietf.org/search/rfc6844#section-5.4):

>  The iodef property specifies a means of reporting certificate issue requests or cases of certificate issue for the corresponding domain that violate the security policy of the issuer or the domain name holder.

You can, optionally, add the `iodef` property to your CAA record by appending a line like so:

```
0 iodef "mailto:security@example.com"
```
