#findfree_workspace.sh
#i3-msg fullscreen toggle
qemu-system-x86_64 -m 4096 --vcpu=2 -hda /DATA/REMOVABLE/BKUP_4TB_ELEMENT/VIRTMAN_EXT_POOL/arch_arco_play.qcow2 
#qemu-system-x86_64 -enable-kvm -boot order=d -m 4096 -hda /DATA/REMOVABLE/BKUP_4TB_ELEMENT/VIRTMAN_EXT_POOL/arch_arco_play.qcow2 
#qemu-system-x86_64 -enable-kvm -boot order=d -net nic -net user,smb=/DATA/cloud/ -cdrom $1 -m 4096 -hda /DATA/REMOVABLE/BKUP_4TB_ELEMENT/VIRTMAN_EXT_POOL/BIGTEST.qcow2
#i3-msg fullscreen toggle
