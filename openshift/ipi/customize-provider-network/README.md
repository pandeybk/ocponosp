# Openshift on Openstack provider network

## Introduction to Provider Network
Typically Provider Network (also known as the external network) often links to the physical network although this is not required. Example of physical network such as virtual LAN(VLAN) or layer-2 (flat(untagged)/bridging/switching). It’s certainly possible to construct a provider network using an overlay protocol (e.g., generic routing encapsulation (GRE) or virtual extensible LAN), and then use software or hardware gateways to map the overlay network to the real network.

Provider networks rely on the actual physical network infrastructure to provide default gateway/first hop routing services. Provider network also includes a DHCP server that provides IP addresses to instances.

## Openshift on provider network
You can deploy your OCP clusters on OpenStack with a primary network interface on a provider network. Installing OpenShift Container Platform clusters on provider networks eliminates the need for tenant networks or floating IP addresses. During installation, the installer does not build these resources.

There are some requirements,
1. Make sure Openstack Networking Service (Neutron) is enabled and accessible through OpenStacl networking API.
2. OSP networking service has the port security and allowed address pairs extensions enabled.
3. Make sure provider network can be shared with other tenants.
4. Verify that the provider network can reach the RHOSP metadata service IP address, which is 169.254.169.254 by default.

## Adjust config
Use `install-dir/install-config.yaml` as a starting install config and modify based on your configuration.

1. In a text editor, open the `install-config.yaml` file.
2. Set the value of the `platform.openstack.apiVIP` property to the IP address for the API VIP.
3. Set the value of the `platform.openstack.ingressVIP` property to the IP address for the Ingress VIP.
4. Set the value of the `platform.openstack.machinesSubnet` property to the UUID of the provider network subnet.
5. Set the value of the `networking.machineNetwork.cidr` property to the CIDR block of the provider network subnet.

> You cannot set the `platform.openstack.externalNetwork` or `platform.openstack.externalDNS` parameters while using a provider network for the primary network interface.

## Create cluster
Once the customization is done create manifests files as follows,
```
OPENSHIFT_INSTALL_CMD="../../scripts/openshift-install"
${OPENSHIFT_INSTALL_CMD} create manifests --dir=install-dir
```
You can change manifests file, add or delete manifest file to some extent.

And finally create cluster.
```
${OPENSHIFT_INSTALL_CMD} create cluster  --dir=install-dir
```

### References:

https://superuser.openstack.org/articles/tenant-networks-vs-provider-networks-in-the-private-cloud-context/

https://docs.openstack.org/newton/install-guide-ubuntu/launch-instance-networks-provider.html

https://docs.openshift.com/container-platform/4.9/installing/installing_openstack/installing-openstack-installer-custom.html#installation-osp-provider-networks_installing-openstack-installer-custom
