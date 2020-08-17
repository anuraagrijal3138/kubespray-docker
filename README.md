For Fedora coreos:

```
/usr/bin/sed -i 's/^enabled=.*/enabled=0/' /etc/yum.repos.d/fedora-updates.repo
```

```
vi group_vars/all/all.yml

where the binaries will be installed

bin_dir: /usr/local/bin

to :
## Directory where the binaries will be installed

bin_dir: /opt/bin
```

Edit kubespray file roles/network_plugin/calico/defaults/main.yml

```
# If you want to use non default IP_AUTODETECTION_METHOD for calico node set this option to one of:
# * can-reach=DESTINATION
# * interface=INTERFACE-REGEX
# see https://docs.projectcalico.org/v3.0/reference/node/configuration#ip-autodetection-methods
# calico_ip_auto_method: "interface=eth.*"


calico_ip_auto_method: "interface=bond1"
```

Edit kubespray file group_vars/k8s-cluster/k8s-cluster.yml

```
Kube_service_addresses: 10.233.128.0/20
kube_pods_subnet: 10.233.144.0/20
```

Edit kubespray file roles/network_plugin/calico/defaults/main.yml

```
# Use IP-over-IP encapsulation across hosts
ipip: false
ipip_mode: 'Never'
```

Change hosts file and ansible-key to allow access to hosts.

Clone latest kubespray code and then make the above changes.



