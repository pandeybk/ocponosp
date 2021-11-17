If you want to construct openshift cluster in OpenStack with customisation, follow following steps

## Create Install config
First create install config as follows. 
OPENSHIFT_INSTALL_CMD="../scripts/openshift-install"
```
${OPENSHIFT_INSTALL_CMD} create install-config --dir=install-dir
```
Now you customize this config file based on your need.

## Create Manifests
Once the customization is done create manifests files as follows,
```
${OPENSHIFT_INSTALL_CMD} create manifests --dir=install-dir
```
You can change manifests file, add or delete manifest file to some extent.

## Create cluster
And finally create cluster.
```
${OPENSHIFT_INSTALL_CMD} create cluster  --dir=install-dir
```


## Destroy cluster
To delete run following
```
${OPENSHIFT_INSTALL_CMD} destroy cluster  --dir=install-dir
```