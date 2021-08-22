redo-always

printf "%s\n" \
	Near/bass_*.tar.xz \
	krom/bass_*.tar.bz2 \
	krom/bass_*.tar.xz \
	krom/bass_*-source.7z \
	qwertymodo/bass_*.tar.xz \
	tukuyomi/tools/bass/bass_*.tar.bz2 \
	tukuyomi/tools/bass/bass_*.tar.xz \
	Screwtape/bass_*.tar.xz |
LC_ALL=C sort > "$3"

redo-stamp < "$3"
