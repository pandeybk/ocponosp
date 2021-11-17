This document is for users who want to perform a standard Red Hat Enterprise Linux 8 installation using the graphical user interface.

I am using Dell T-640 server for this demostration. 

## GUI-based installation
- There are various way you can install RHEL. For this demostration I am using GUI-based installation with an DVD ISO image file which contains all repositories and software packages and does not require any additional configuration. You can also use Boot ISO image which is a minimal image file that supports registering your system, attaching subscriptions, and installing RHEL from the Content Delivery Network (CDN).
- You can download DVD ISO from the Customer Portal. In this methog registration is performed after the GUI installation completes.

## Prerequisites

- You have an active Red Hat subscription.
- You are logged in to the Product Downloads section of the Red Hat Customer Portal at [Product Downloads](https://access.redhat.com/downloads).

## Downloading an ISO image from the Customer Portal
> Note: Make sure you have `curl` and `jq` client install in your machine

- Offline generated token from [Red Hat API Tokens](
https://access.redhat.com/management/api)
- Checksum of the file you want to download from [Product Downloads](https://access.redhat.com/downloads/)
- Export offline token and checksum and execute `01-download-rhel.sh`
```
export offline_token="<offline_token>"
export checksum="1f78e705cd1d8897a05afa060f77d81ed81ac141c2465d4763c0382aa96cadd0"
```
## Installation
We are going to use IDRAC9 to mount this ISO and complete the installation. Follow video guide for more information.

## Reference:
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/performing_a_standard_rhel_installation/index