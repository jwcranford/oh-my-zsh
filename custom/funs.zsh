# mf - simple function to display a jar's manifest
mf() {
        unzip -p $1 META-INF/MANIFEST.MF
}

watch() {
	clear
        while true; do
		echo At `date`
                "$@"
                sleep 2
		echo
        done
}

new() {
	mkdir "$1" && cd "$1"
}
