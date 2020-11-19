redo-ifchange "$2.7z"

extract_path="$2.7z.files"

rm -rf "$extract_path"
mkdir -p "$extract_path"

7z x -o"$extract_path" "$2.7z" >&2

# bass_v15-source.7z is the only archive that includes a parent directory for
# the bass and nall subdirectories. So, we change into it and archive `*`
# instead of `.` to guarantee we produce a tarball that's laid out like the
# others.
(cd "$extract_path"/* && tar c *)

rm -rf "$extract_path"
