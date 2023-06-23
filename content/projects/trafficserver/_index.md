---
title: Apache Traffic Server security advisories
description: Security information for Apache Traffic Server
layout: single
---

# Reporting

Do you want disclose a potential security issue for Apache Traffic Server? You can read more about the projects' security policy on their [security page](None), and email your report to the  [Apache Traffic Server Security Team](mailto:security@trafficserver.apache.org).

# Advisories

## Improperly handled requests can cause crashes in specific plugins ## { #CVE-2022-32749 }

[CVE-2022-32749](./CVE-2022-32749.cve.json)

### Affected

* Apache Traffic Server versions 8.0.0 including 9.1.3


### Description



Improper Check for Unusual or Exceptional Conditions vulnerability handling requests in Apache Traffic Server allows an attacker to crash the server under certain conditions.

<p>This issue affects Apache Traffic Server: from 8.0.0 through 9.1.3.</p>

## Improperly reading the client requests ## { #CVE-2022-37392 }

[CVE-2022-37392](./CVE-2022-37392.cve.json)

### Affected

* Apache Traffic Server versions 8.0.0 including 9.1.3


### Description

Improper Check for Unusual or Exceptional Conditions vulnerability in handling the requests to Apache Traffic Server.  This issue affects Apache Traffic Server 8.0.0 to 9.1.2.

## Security issues with the xdebug plugin ## { #CVE-2022-40743 }

[CVE-2022-40743](./CVE-2022-40743.cve.json)

### Affected

* Apache Traffic Server versions 9.0.0 including 9.1.3


### Description

Improper Input Validation vulnerability for the xdebug plugin in Apache Software Foundation Apache Traffic Server can lead to cross site scripting and cache poisoning attacks.<p>This issue affects Apache Traffic Server: 9.0.0 to 9.1.3. Users should upgrade to 9.1.4 or later versions.<br></p>

## The TRACE method can be use to disclose network information ## { #CVE-2022-47184 }

[CVE-2022-47184](./CVE-2022-47184.cve.json)

### Affected

* Apache Traffic Server versions 8.0.0 including 9.2.0


### Description

Exposure of Sensitive Information to an Unauthorized Actor vulnerability in Apache Software Foundation Apache Traffic Server.<p>This issue affects Apache Traffic Server: 8.0.0 to 9.2.0.</p>

## Configuration option to block the PUSH method in ATS didn't work ## { #CVE-2023-30631 }

[CVE-2023-30631](./CVE-2023-30631.cve.json)

### Affected

* Apache Traffic Server versions 8.0.0 including 9.2.0


### Description

Improper Input Validation vulnerability in Apache Software Foundation Apache Traffic Server.&nbsp; The configuration option&nbsp;proxy.config.http.push_method_enabled didn't function.&nbsp; However, by default the PUSH method is blocked in the ip_allow configuration file.<p>This issue affects Apache Traffic Server: from 8.0.0 through 9.2.0.</p><p>8.x users should upgrade to 8.1.7 or later versions<br>9.x users should upgrade to 9.2.1 or later versions<br></p>

## s3_auth plugin problem with hash calculation ## { #CVE-2023-33933 }

[CVE-2023-33933](./CVE-2023-33933.cve.json)

### Affected

* Apache Traffic Server versions 8.0.0 including 9.2.0


### Description

Exposure of Sensitive Information to an Unauthorized Actor vulnerability in Apache Software Foundation Apache Traffic Server.<p>This issue affects Apache Traffic Server: from 8.0.0 through 9.2.0.</p><p>8.x users should upgrade to 8.1.7 or later versions<br>9.x users should upgrade to 9.2.1 or later versions<br></p>