redo-ifchange ../sources/combined_releases.txt

cat <<'EOF'
bass history
============

This repository contains
the reconstructed development history
of the bass cross-assembler.
It is built from the archives and changelogs
in [the bass-history-kit repository][kit].

[kit]: https://github.com/bass-assembler/bass-history-kit/

This repository is not stable,
and may be rebuilt from scratch
as the kit is updated with newly recovered archives,
or smarter ways to process the source material into a Git repository.

Active development of bass continues
at https://github.com/ARM9/bass
so go there if you want to contribute changes or suggestions.

Repository layout
=================

The `master` branch only contains this README and LICENSE,
and can be ignored.
The licence applies to all versions of bass in this repository,
but since it was never included in a release archive,
it has not been included in the historical commits.

The `history` branch contains the full development history reconstructed by
[the bass history kit][kit].

Tags like `v123` exist for each surviving stable bass release.
The tag `v14` marks the point from which ARM9's bass repository began.

You can graft the reconstructed history onto ARM9's repository like this:

    $ cd path/to/ARM9/bass
    $ git fetch path/to/this/repository v14
    $ git replace --graft 6da8424 FETCH_HEAD

History holes
=============

Sadly,
some history has been lost,
and not every version has both a changelog and an archive.
There may be other versions for with neither have survived,
but since we have no evidence of them,
we can't put them in a list.

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
