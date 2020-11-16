redo-ifchange ./archives.txt

# Extract all the metadata for each archive
redo-ifchange $(
    sed -e 's/$/.version/' ./archives.txt
    sed -e 's/$/.date/'    ./archives.txt
    sed -e 's/$/.hash/'    ./archives.txt
)

last_archive=""
last_version=""
last_hash=""

cat ./archives.txt |
    # Join all the archive metadata into a single table
    while read -r archive; do
        version=$(cat "$archive".version)
        date=$(cat "$archive".date)
        hash=$(cat "$archive".hash)
        printf "%s %s %s %s\n" "$date" "$version" "$archive" "$hash"
    done |
    # Sort it, so we can do a uniqueness pass on it
    LC_ALL=C sort |
    while read -r date version archive hash; do
        # If this archive supposedly represents the same release
        # as the previous archive...
        if [ x"$version" = x"$last_version" ]; then
            # ...and their hashes match...
            if [ x"$hash" = x"$last_hash" ]; then
                # ...then it *is* the same as the previous archive,
                # we can ignore it.
                continue
            else
                # Otherwise, fail loudly.
                echo "Version $version differs from $last_archive to $archive" >&2
                exit 1
            fi
        # Otherwise, this is a new release, so print it and update our state.
        else
            printf "%s %s %s\n" "$date" "$version" "$archive"
            last_archive="$archive"
            last_version="$version"
            last_hash="$hash"
        fi
    done > "$3"
