history | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 20
