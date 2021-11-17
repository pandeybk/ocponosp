## Introduction
TripleO is the friendly name for “OpenStack on OpenStack”. It is an official OpenStack project aimed at installing, upgrading and operating OpenStack clouds using OpenStack’s own cloud facilities as the foundation - building on Nova, Ironic, Neutron and Heat to automate cloud management at datacenter scale

## Architecture
With TripleO, you start by creating an “undercloud” (a deployment cloud) that will contain the necessary OpenStack components to deploy and manage an “overcloud” (a workload cloud). The overcloud is the deployed solution and can represent a cloud for any purpose (e.g. production, staging, test, etc).



### References:
https://docs.openstack.org/tripleo-docs/latest/
https://docs.openstack.org/tripleo-docs/latest/install/introduction/architecture.html