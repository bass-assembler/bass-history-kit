redo-ifchange ./archives.txt

redo-ifchange $(
    sed -e 's/$/.version/' ./archives.txt
    sed -e 's/$/.date/' ./archives.txt
)

cat ./archives.txt |while read -r archive; do
    version=$(cat "$archive".version)
    date=$(cat "$archive".date)
    printf "%s %s %s\n" "$date" "$version" "$archive"
done | LC_ALL=C sort > "$3"
