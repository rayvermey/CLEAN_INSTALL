VM=$1
virsh destroy $VM
virsh undefine --nvram $VM
virt-install --name=$VM \
--vcpus=2 \
--memory=8196 \
--graphics spice \
--boot uefi \
--cdrom=/home/ray/BUILDING/BMOI/out/archlinux-2021.02.06-x86_64.iso \
--disk path=/DATA/REMOVABLE/BKUP_4TB_ELEMENT/VIRTMAN_EXT_POOL/$VM.qcow2,size=50,format=qcow2 \
--os-variant=archlinux \
--check all=off
