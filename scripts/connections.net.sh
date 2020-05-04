netstat -ept | grep ESTAB | awk {print } | cut -d: -f1 | sort | uniq -c | sort -nr
