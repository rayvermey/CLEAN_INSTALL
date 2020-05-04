qemu-system-x86_64 -enable-kvm -boot order=d -net nic -net user,smb=/DATA_CLOUD/ -cdrom $1 -m 4096 
