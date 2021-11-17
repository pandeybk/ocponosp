sudo openstack tripleo container image prepare default --output-env-file $HOME/containers-prepare-parameters.yaml

cat <<EOF > $HOME/standalone_parameters.yaml
parameter_defaults:
  NtpServer: time.google.com
  CloudName: $IP
  CloudDomain: osp.home.lab
  ControlPlaneStaticRoutes:
    - ip_netmask: 0.0.0.0/0
      next_hop: $GATEWAY
      default: true
  Debug: true
  DeploymentUser: $USER
  DnsServers:
    - $DNS1
    - $DNS2
  NeutronPublicInterface: $INTERFACE
  NeutronDnsDomain: localdomain
  NeutronBridgeMappings: datacentre:br-ctlplane
  NeutronPhysicalBridge: br-ctlplane
  StandaloneEnableRoutedNetworks: false
  StandaloneHomeDir: $HOME
  StandaloneLocalMtu: 1500
  OctaviaAmphoraSshKeyFile: "/home/stack/.ssh/id_rsa.pub"
EOF
