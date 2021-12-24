while read -r line
do
    echo "Login in to $line"
    SSHPASS=qazwsx12 sshpass -e ssh-copy-id ray@"$line" -o "StrictHostKeyChecking no"
done < "ssh_servers.txt"
