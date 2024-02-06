#!/bin/bash

echo -e "\e[1;34mPHP Nulled Script Scanner\e[0m"
echo ""

read -p "Enter The Path To Your PHP Files (The Root Directory): " phplocation

if [ ! -d "$phplocation" ]; then
    echo "Directory $phplocation does not exist."
    exit 1
fi

declare -a check_strings=("shell_exec" "base64_decode" "edoced_46esab" "fopen" "fclose" "phpinfo" "system" "php_uname" "chmod" "readfile" "eval" "passthru" "exec" "popen" "proc_open" "assert")

total_count=0

for check_string in "${check_strings[@]}"
do
    echo -e "\e[1;33mChecking for $check_string strings...\e[0m"
    count=$(grep -Rn "$check_string" $phplocation | wc -l)
    echo "Found $count occurrences."
    total_count=$((total_count + count))
    echo -e "\e[1;32mDone.\e[0m"
    echo ""
done

echo -e "\e[1;34mScan completed.\e[0m"
echo "Total potential issues found: $total_count"
echo ""
exec 2>&1
