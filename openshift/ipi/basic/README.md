If you want to construct a simple openshift cluster in OpenStack with no customisation, run the command below.


## Create cluster
```
OPENSHIFT_INSTALL_CMD="../../scripts/openshift-install"
${OPENSHIFT_INSTALL_CMD} create cluster  --dir=install-dir
```

Now follow the installation guide to create the cluster. Make sure to select `openstack` as platform.

## Destroy cluster
To delete run following
```
../../scripts/openshift-install destroy cluster  --dir=install-dir
```