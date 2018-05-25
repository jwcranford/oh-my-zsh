# mf - simple function to display a jar's manifest
mf() {
        unzip -p $1 META-INF/MANIFEST.MF
}

watch() {
        while true; do
                clear
                "$@"
                sleep 2
        done
}

sort-by-length() {
        perl -e '@a=<>;print (sort {length($a) <=> length($b)} @a)' $*
}
