#!/bin/bash
export KUBECONFIG="/home/user/.kube/config"
export APISERVER_CERT_LOCATION="/etc/virtual-kubelet/client.crt"
export APISERVER_KEY_LOCATION="/etc/virtual-kubelet/client.key"
cd /home/user/projects/virtual-kubelet

export KUBELET_PORT="10251"
export VKUBELET_POD_IP="192.168.2.1"
./bin/virtual-kubelet --nodename vkubelet-mock-0 --provider mock --provider-config ./hack/skaffold/virtual-kubelet/vkubelet-mock-0-cfg.json --disable-taint &
export KUBELET_PORT="10252"
export VKUBELET_POD_IP="192.168.2.2"
./bin/virtual-kubelet --nodename vkubelet-mock-1 --provider mock --provider-config ./hack/skaffold/virtual-kubelet/vkubelet-mock-0-cfg.json --disable-taint &
export KUBELET_PORT="10253"
export VKUBELET_POD_IP="192.168.2.3"
./bin/virtual-kubelet --nodename vkubelet-mock-2 --provider mock --provider-config ./hack/skaffold/virtual-kubelet/vkubelet-mock-0-cfg.json --disable-taint &
export KUBELET_PORT="10254"
export VKUBELET_POD_IP="192.168.2.4"
./bin/virtual-kubelet --nodename vkubelet-mock-3 --provider mock --provider-config ./hack/skaffold/virtual-kubelet/vkubelet-mock-0-cfg.json --disable-taint &

wait