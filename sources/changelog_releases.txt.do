redo-ifchange \
    tukuyomi/changelog_list.txt \
    kawa/changelog_list.txt \
    byuu/changelog_list.txt

path_prefix() {
    cat "$1"/changelog_list.txt |
        while read date version path; do
            printf "%s %s %s/%s\n" "$date" "$version" "$1" "$path"
        done
}

# It turns out we have no duplicate or even interleaved changelogs,
# so we can just hard-code the order here.
path_prefix tukuyomi
path_prefix kawa
path_prefix byuu
