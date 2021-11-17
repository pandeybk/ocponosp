
# All-In-One Red Hat Openstack Platform (RHOSP) Installation
This document describes how to use the TripleO tool to deploy the Red Hat OpenStack Platform and related services in a single-node environment.
This installation is solely intended for proof-of-concept, development, and testing and shouldn't be used in any production environment.


## Prerequisites
The minimum specification for a machine are

- Red Hat Enterprise Linux 8.2 base operating system installed. For this demonstration I am using RHEL 8.5.
- 4 Core CPU
- 8 GB memory
- 30 GB free disk space

## Installation

### Prepare Environment
Before you can begin configuring, deploying, and testing your all-in-one environment, you must configure a non-root user and install the necessary packages and dependencies:

Create username called `stack` using `01-create-stack-user.sh`

### Install packages for the all-in-one environment.
Log in as the `stack` user on the all-in-one host using `ssh stack@<all-in-one>` and install packages using `02-install-packages.sh`

To set the `container-tools` and `virt` module versions, execute `03-set-module-versions.sh` and Update base operating system. Finally reboot the systems
```
sudo reboot
```

Log back in and install tripleoclient using `04-install-tripleoclient.sh`

### Configure the all-in-one environment.
Generating YAML files for the all-in-one OpenStack environment using `05-generate-yaml.sh`. Make sure to adjust following environment variable before your run this script.

```
export IP=192.168.7.213
export INTERFACE=eno1np0
export NETMASK=24
export DNS1=8.8.8.8
export DNS2=8.8.4.4
export GATEWAY=192.168.4.1
```

This will produce 2 files,
- [$HOME/containers-prepare-parameters.yaml(sample)](containers-prepare-parameters.yaml)
Edit your $HOME/containers-prepare-parameters.yaml file to include your Red Hat credentials. 

```
parameter_defaults:
  ContainerImagePrepare:
  ...
  ContainerImageRegistryCredentials:
    registry.redhat.io:
      <USERNAME>: "<PASSWORD>"
```

- [$HOME/standalone_parameters.yaml(sample)](standalone_parameters.yaml)
Make sure file produce is correct.

### Deploy the all-in-one environment.
- Log in to registry.redhat.io with your Red Hat credentials:
```
sudo podman login registry.redhat.io
```

- Run the `06-deploy-all-in-one-osp.sh`. 

After a successful deployment, you can use the clouds.yaml configuration file in the /home/$USER/.config/openstack directory to query and verify the OpenStack services:

```
export OS_CLOUD=standalone
openstack endpoint list
```

To access the dashboard, go to to http://192.168.7.213/dashboard and use the default username admin and the `undercloud_admin_password` from the `~/standalone-passwords.conf` file:


### Cleanup
You can delete the openstack setup using `07-cleanup.sh` script.

## References:

- [Openstack installation](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.2/html/standalone_deployment_guide/all-in-one-openstack-installation)
- [Cleanup Openstack](https://www.redhat.com/sysadmin/tripleo-standalone-system)
