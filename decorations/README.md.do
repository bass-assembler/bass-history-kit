redo-ifchange ../sources/combined_releases.txt

cat <<EOF
bass history
============

This repository contains
the reconstructed development history
of the bass cross-assembler.
It is built from the archives and changelogs
in the bass-history-kit repository.

Active development of bass continues
at https://github.com/ARM9/bass

Missing archives
----------------

The following releases have changelogs,
but no archives of them have survived.
If you have a copy of of one of these versions
(preferably an unmodified original archive, but anything's better than nothing)
please get in touch!

EOF

grep '.-$' ../sources/combined_releases.txt | while read _ version _ _; do
    printf "  - %s\n" "$version"
done

cat <<EOF

Missing changelogs
------------------

The following releases have archives,
but the changelogs describing them have been lost.
If you have a changelog for any of these releases,
please get in touch!

EOF

grep ' - ' ../sources/combined_releases.txt | while read _ version _ _; do
    printf "  - %s\n" "$version"
done
