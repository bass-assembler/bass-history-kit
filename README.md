bass history kit
================

bass is [byuu]'s cross-assembler,
which he used for making SNES homebrew and ROM hacks,
among other things.
While official development is now done [in git][arm9bass],
that repository only goes back to v14,
so exploring the development history before that point
requires a separate solution.

[arm9bass]: https://github.com/ARM9/bass

This repository contains the surviving release archives and changelogs,
scripts to analyse and clean up those sources, and a script to export them
in the format accepted by the `git fast-import` command, to turn them into a
consistently-formatted Git repository.

Results
=======

If you can't use this kit yourself, or if you'd rather not, an example history
repository is available at https://github.com/byuu/bass-history/

Note that the pre-built repository may have been built by an older version of
the kit, and so may not be as accurate as it could be.

Ingredients
===========

To build a `bass-history` repository, you will need:

  - a POSIX operating system
  - The `7z` archive tool
  - Python 3.x (tested with 3.8, older versions may work)
  - The content of this repository

Optional ingredients
--------------------

These extra ingredients may improve your experience:

  - [redo] will let you incrementally rebuild the analysis of the sources,
    if you want to tinker with the import process yourself, instead of always
    redoing all the analysis from scratch every time.

[redo]: https://github.com/apenwarr/redo

Building
========

How to build your own `bass-history` repository:

 1. Check out this repository somewhere:

        $ git clone https://github.com/byuu/bass-history-kit.git
        $ cd bass-history-kit

 1. Run the preparation script, to analyse and collate the sources:

        $ ./do prepare

    (if you have [redo] installed, you may `redo prepare`, or even
    `redo -j10 prepare` if you have a lot of CPUs and want to save some time)

 1. Make a new Git repository to receive the bass history:

        $ cd ..
        $ git init bass-history
        $ cd bass-history

 1. Export the bass historical data into git:

        $ ../bass-history-kit/history-fast-export | git fast-import

 1. Because `git fast-import` stores data uncompressed for speed, and because
    it only updates the Git object store, not the working directory, do some
    house-keeping:

        $ git gc --aggressive
        $ git reset --hard HEAD

 1. Enjoy your new bass history Git repository!

Grafting
========

It is possible to graft together the bass-history repository
with the ARM9 current-development repository
to produce a unified history of bass development,
using the `git replace` tool.

Follow the regular building steps above to create a `bass-history` repository.
Then:

 1. Check out the ARM9 bass repo:

        $ cd ..
        $ git clone https://github.com/ARM9/bass.git
        $ cd bass

 1. Fetch the `v14` tag from the bass-history repo, which automatically
    fetches all the tags and history leading up to that point:

        $ git fetch ../bass-history tag v14

 1. Tell git to replace the oldest commit in the higan repo with the newest
    commit on the 'history' branch:

        $ git replace 6da8424 graft-point

Now commands like `git log` should show you the complete bass development
history from the oldest surviving changes up until the present day!

Citations
=========

See the READMEs in each subdirectory of [sources](sources/) for provenance
information.
