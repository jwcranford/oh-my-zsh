alias ls="`whence ls` -CF"
alias h=history
alias v='vim -R -Z'
alias p="$PAGER"
alias rm='rm -i'
alias gitl='git log --graph --name-only --decorate --abbrev-commit'
alias gpg-verify='gpg -v --verify'
alias emacs='/Users/jcranford/Applications/Aquamacs.app/Contents/MacOS/Aquamacs'
alias geany='/Users/jcranford/Applications/Geany.app/Contents/MacOS/geany'
alias k=kubectl

ARCH=`uname`
case $ARCH in
        FreeBSD)
                alias whatup="ps ahux | sort +1n |p"
                ;;
        HP)
                alias whatup='ps -ef |sort +1n |p'
                alias whatido='ps -fu $LOGNAME | sort +1n'
                alias whatelse='ps -ef |grep -v "$LOGNAME" |grep -v root |grep -v daemon |grep -v lp'
                ;;
        Linux)
                alias whatup='ps -ef --forest --sort=pid |p'
#               alias whatido='ps -fu $LOGNAME --forest --sort=pid'
                alias whatido='ps -fu $USER --forest --sort=pid'
                alias memusg='ps -ely --forest --sort=-rss |p'
                alias whatbusy='ps aux |sort +7'
                ;;
        Darwin)
                alias whatup="ps Ahuc | sort -n -k 2 |p"
                alias whatbusy='ps Ahuc -r |p'
                alias memusg='ps Ahuc -m |p'
                alias grep='grep --color'
#                alias free='top -l 1 1|grep free'
                alias calc='open /System/Applications/Calculator.app'
		alias sha1='openssl dgst -sha1'
		alias md5sum='md5 -r'
		alias ls='ls -GCF'
		alias ll='ls -l'
		alias sha256sum='shasum -a 256'

		# wrappers around md5 for Mac - emulates the -c option of md5sum

function md5-c {
        if [ "$#" = "2" ]; then
                file=$2
        else
                file=`perl -ne '/^MD5 \(([^\)]+)\)/;print "$1\n"' $1`
                echo "Using $file..."
        fi
        md5 "$file" | /usr/bin/diff -bw "$1" - && echo Checksum matches
}

# usage: md5sum-c mdsum.txt file-to-checksum
function md5sum-c {
	if [ "$#" = "2" ]; then
		grep "$2" "$1" > /tmp/$$
		md5 -r "$2" |diff -bw /tmp/$$ - && echo Checksum matches
	else
		echo Usage: md5sum-c mdsum.txt file-to-checksum
	fi
        #awk '{print $2}' "$1" | xargs md5 -r | diff -bw "$1" - && echo Checksum matches
}

function memtotals() {
        top -l 1 |grep Mem
        echo -n 'Total memory used by processes: '
        ps Auc |awk 'BEGIN{m=0} {m += $6} END{print m}'
}


                ;;
esac

