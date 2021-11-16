curl -LO https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.9/4.9.0/rhcos-openstack.x86_64.qcow2.gz
gzip -d rhcos-openstack.x86_64.qcow2.gz 
rm -rf rhcos-openstack.x86_64.qcow2.gz
openstack image create --container-format=bare --disk-format=qcow2 --file rhcos-openstack.x86_64.qcow2 rhcos-openstack.4.9.0.x86_64.qcow2
