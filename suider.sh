#!/bin/bash
#Author : etc5had0w
#Github : https://github.com/etc5had0w
# This Tool Searches For known explotable Binaries that has SUID bit set.
# Warning : There might be custom binaries with SUID bit but this tool only outputs standard binaries with thier available exploit from GTFOBINS.
echo "==================================="
echo " SUIDER - SUID Exploit Finder Tool "
echo "==================================="

echo "[+] Looking for standard exploitable SUID binaries...."
r=$(find / -perm -u=s -type f 2>/dev/null | rev | cut -d'/' -f 1 | rev)


output=($r)
dict=(aria2c arp ash base32 base64 basenc bash busybox capsh cat chmod chown chroot column comm cp csh csplit curl cut dash date dd dialog diff dmsetup docker emacs env eqn expand expect find flock fmt fold gdb gimp grep gtester hd head hexdump highlight iconv install ionice ip jjs join jq jrunscript ksh ks ld.so less logsave look lwp-download lwp-request make more mv nano nice nl node nohup od openssl paste perl pg php pico pr python readelf restic rev rlwrap rpm rpmquery rsync run-parts rview rvim sed setarch shuf soelim sort ss ssh-keyscan start-stop-daemon stdbuf strace strings sysctl systemctl tac tail taskset tbl tclsh tee tftp time timeout troff ul unexpand uniq unshare update-alternatives uudecode uuencode view vim watch wget xargs xmodmap xxd xz zsh zsoelim)

result=()

for a in "${output[@]}"; do
    for b in "${dict[@]}"; do
        if [[ $a == "$b" ]]; then
            result+=( "$a" )
            break
        fi
    done
done

if [[ -z ${result[@]} ]]
then 
	echo "[-] Nothing Found!"

else

	echo '------------------------------'
	echo " LIST OF EXPLOITABLE BINARIES"
	echo '------------------------------'
	

	for i in "${result[@]}"
	do

		printf '%s' "[+] $i : "
		echo " https://gtfobins.github.io/gtfobins/$i "
	done
fi
