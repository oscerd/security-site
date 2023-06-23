---
title: Apache bRPC security advisories
description: Security information for Apache bRPC
layout: single
---

# Reporting

Do you want disclose a potential security issue for Apache bRPC? Send your report to the  [Apache Security Team](mailto:security@apache.org).

# Advisories

## ServerOptions.pid_file may cause arbitrary code execution ## { #CVE-2023-31039 }

[CVE-2023-31039](./CVE-2023-31039.cve.json)

### Affected

* Apache bRPC versions 0.9.0 before 1.5.0


### Description

<span style="background-color: rgb(255, 255, 255);">Security vulnerability&nbsp;</span>in Apache bRPC &lt;1.5.0 on all platforms allows attackers to execute arbitrary code via ServerOptions::pid_file.<br>An attacker that can influence the ServerOptions pid_file parameter with which the bRPC server is started can execute arbitrary code with the permissions of the bRPC process.<br><br>Solution:<br>1. upgrade to bRPC &gt;= 1.5.0, download link:&nbsp;<a target="_blank" rel="nofollow" href="https://dist.apache.org/repos/dist/release/brpc/1.5.0/">https://dist.apache.org/repos/dist/release/brpc/1.5.0/</a><br>2. If you are using an old version of bRPC and hard to upgrade, you can apply this patch:&nbsp;<a target="_blank" rel="nofollow" href="https://github.com/apache/brpc/pull/2218">https://github.com/apache/brpc/pull/2218</a>