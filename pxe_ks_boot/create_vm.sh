virt-install --connect=qemu:///system --name linux-pxe --hvm --virt-type kvm \
--ram 4096 --vcpus 4 --arch x86_64 \
--os-variant rhel8.3 \
--disk path=/var/kvm/images/linux9-pxe.img,size=20 \
--network network=mynetwork2,model=virtio --graphics none \
--serial pty --console pty \
--location http://192.168.255.2/linux9/ \
--extra-args "inst.ks=http://192.168.255.2/ks/linux9-ks.cfg console=tty0 console=ttyS0,115200n8"

virsh attach-interface --domain linux-pxe --type network --source default --model virtio
